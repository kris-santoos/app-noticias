# syntax = docker/dockerfile:1

FROM ruby:3.2.2-slim as base

WORKDIR /rails

ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development"

FROM base as build

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git libvips pkg-config nodejs yarn

COPY Gemfile Gemfile.lock ./
RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git && \
    bundle exec bootsnap precompile --gemfile

# Copia o master.key para o build (se você usar credenciais encriptadas)
COPY config/master.key config/master.key

COPY . .

# Dá permissão de execução para ./bin/rails (importante)
RUN chmod +x ./bin/rails

RUN bundle exec bootsnap precompile app/ lib/

# Cria um database.yml temporário simples para evitar erro de parsing
RUN echo "default: &default\n  adapter: sqlite3\n  database: db/development.sqlite3\n  pool: 5\n  timeout: 5000\n\ndevelopment:\n  <<: *default\ntest:\n  <<: *default\nproduction:\n  <<: *default" > config/database.yml

ARG RAILS_MASTER_KEY
RUN RAILS_ENV=production SECRET_KEY_BASE=temporarysecret RAILS_MASTER_KEY=$RAILS_MASTER_KEY ./bin/rails assets:precompile --trace

FROM base

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y curl libsqlite3-0 libvips nodejs yarn && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /rails /rails

RUN useradd rails --create-home --shell /bin/bash && \
    chown -R rails:rails db log storage tmp

USER rails:rails

ENTRYPOINT ["/rails/bin/docker-entrypoint"]

EXPOSE 3000

CMD ["./bin/rails", "server"]

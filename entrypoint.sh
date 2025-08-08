#!/bin/bash
set -e

echo "Gerando config/database.yml..."

cat > config/database.yml <<EOF
default: &default
  adapter: postgresql
  encoding: unicode
  host: ${DATABASE_HOST:-localhost}
  username: ${DATABASE_USERNAME:-postgres}
  password: "${DATABASE_PASSWORD:-}"
  pool: 5

development:
  <<: *default
  database: app_noticias_development

test:
  <<: *default
  database: app_noticias_test

production:
  <<: *default
  database: app_noticias_production
EOF

echo "Arquivo config/database.yml criado com sucesso."

echo "Rodando migrations pendentes..."
bin/rails db:migrate

exec "$@"

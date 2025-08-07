class ArticlesController < ApplicationController
  

  # GET /articles or /articles.json
  def index
    @articles = Article.all

    news_api = NewsApi.new

    per_page = 20
    page = (params[:page] || 1).to_i
    offset = (page - 1) * per_page

    if params[:query].present?
      @external_news = news_api.search_news(params[:query])[offset, per_page]
    else
      @external_news = []
  end
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/1/edit
  def edit
  end

end

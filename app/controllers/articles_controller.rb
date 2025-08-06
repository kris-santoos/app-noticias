class ArticlesController < ApplicationController
  

  # GET /articles or /articles.json
  def index
    @articles = Article.all

    news_api = NewsApi.new

    if params[:query].present?
      @external_news = news_api.search_news(params[:query]).first(5)
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

class ArticlesController < ApplicationController
  
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

  def show
  end
  
  def edit
  end

end

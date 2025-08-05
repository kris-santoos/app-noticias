class SavedNewsController < ApplicationController
    
  def index
    @saved_news = SavedNews.all
  end

  def create
    saved = SavedNews.new(saved_news_params)

    if saved.save
      redirect_to articles_path, notice: "Notícia salva com sucesso!"
    else
      redirect_to articles_path, alert: "Erro ao salvar notícia."
    end
  end

  private

  def saved_news_params
    params.require(:saved_news).permit(:title, :description, :url)
  end
end

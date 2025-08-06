class SavedNewsController < ApplicationController
  def index
    @saved_news = SavedNews.all
  end

def create
  @saved_news = SavedNews.new(saved_news_params)

  if @saved_news.save
    respond_to do |format|
      format.html { redirect_to articles_path, notice: "Notícia salva com sucesso!" }
      format.js   # Vai buscar o create.js.erb
    end
  else
    respond_to do |format|
      format.html { redirect_to articles_path, alert: "Erro ao salvar notícia." }
      format.js
    end
  end
end


  private

  def saved_news_params
    params.require(:saved_news).permit(:title, :description, :url)
  end
end

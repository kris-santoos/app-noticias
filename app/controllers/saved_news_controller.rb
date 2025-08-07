class SavedNewsController < ApplicationController
  
  before_action :require_logged_in_user
  
  def index
    @saved_news = current_user.saved_news
  end

  def create
    @saved_news = current_user.saved_news.build(saved_news_params)

    if @saved_news.save
      respond_to do |format|
        format.html do
          flash[:success] = "Artigo salvo com sucesso!"
          redirect_to articles_path
        end

        format.js 
      end
    else
      puts @saved_news.errors.full_messages.inspect
      respond_to do |format|
        if @saved_news.errors.full_messages.any? { |msg| msg.include?("Url já cadastrado") }
          format.html do
            flash[:danger] = "Esse artigo já foi salvo."
            redirect_to articles_path
          end
        else
          format.html do
            flash[:danger] = "Erro ao salvar artigo."
            redirect_to articles_path
          end

          format.js
        end
      end
    end
  end

  def destroy
    @saved_news = current_user.saved_news.find(params[:id])
    @saved_news.destroy

    respond_to do |format|
      format.html do
        flash[:success] = "Artigo removido com sucesso!"  
        redirect_to saved_news_index_path
      end

      format.js   
    end
  end

  private

  def saved_news_params
    params.require(:saved_news).permit(:title, :description, :source, :url)
  end
end

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show destroy]
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
      respond_to do |format|
        if @article.save
        format.html { redirect_to article_path(@article), notice: 'Article was created'}
        else
          format.html { render new, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @article.destroy!

    respond_to do |format|
      format.html {redirect_to articles_path, notice: 'Article was successfully deleted'}
      format.json {head :no_content}
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
    
end

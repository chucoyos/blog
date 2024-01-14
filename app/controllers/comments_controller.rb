class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to @article
    flash[:notice] = 'Comment was successfully created'
  end
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to @article
    flash[:notice] = 'Comment was deleted'
  end
  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
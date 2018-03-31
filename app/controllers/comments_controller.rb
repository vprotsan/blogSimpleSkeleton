class CommentsController < ApplicationController
  # http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(comment_params)
    @comment.article_id = @article.id

    if @comment.save
      redirect_to @article
    else
      render template: 'articles/show'
    end
  end

  def destroy
    comment = Comment.find(params[:id]).delete
    redirect_to article_path(comment.article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end

class CommentsController < ApplicationController
  # http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(comment_params)
    @comment.article_id = @article.id

    respond_to do |format|
      if @comment.save

        format.html do
          redirect_to @article
        end
        format.json { render json: @comment.to_json }
        # redirect_to @article
      else
        # render template: 'articles/show'
        format.html { render 'articles/show'} ## Specify the format in which you are rendering "new" page
        format.json { render json: @comment.errors } ## You might want to specify a json format as well
      end
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

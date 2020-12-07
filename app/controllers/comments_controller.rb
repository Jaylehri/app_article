class CommentsController < ApplicationController
  before_action :set_comment, only: [:create, :destroy]
  http_basic_authenticate_with name: "jay", password: "lahari", only: :destroy
  
  def create
    # @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
   # @comment.user_id = current_user.id
    redirect_to article_path(@article)
  end
 
  def destroy
    # @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to article_path(@article) }
      format.js { render layout: false }
    # redirect_to article_path(@article)
    end
  end
 
  private
    def set_comment
          @article = Article.find(params[:article_id])
    end

    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end

# class CommentsController < ApplicationController
# def create
# @article = Article.find(params[:article_id])
# @comment = @article.comments.create(comment_params)
# redirect_to article_path(@article)
# end
# def destroy
# @article = Article.find(params[:article_id])
# @comment = @article.comments.find(params[:id])
# @comment.destroy
# #redirect_to article_path(@article)
# respond_to do |format|
# format.html { respond_to comment_params, notice: 'Comment was successfully remove '}
# format.js
# end
# end
# private
# def comment_params
# params.require(:comment).permit(:commenter, :body)
# end
# end
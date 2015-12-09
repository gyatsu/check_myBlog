class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to post_url(@comment.post_id)

  end

  def destroy
    @comment = Comment.find(params[:id])
    post_id = @comment.post_id
    @comment.destroy
    # redirect_to post_url(post_id)
    redirect_to posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(
      :body,
      :post_id,
      :user_id
    )
  end
end

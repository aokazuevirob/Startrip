class Admin::ReviewCommentsController < ApplicationController

  def destroy
    @review_comment = ReviewComment.find_by(id: params[:id], review_id: params[:review_id])
    @review_comment.destroy
    @review = Review.find(params[:review_id])
    render :destroy
  end

  private

  def review_comment_params
    params.require(:review_comment).permit(:comment, :user_id, :review_id)
  end
end

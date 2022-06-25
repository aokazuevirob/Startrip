class Public::ReviewCommentsController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    # 投稿に紐づいたコメントの作成
    @review_comment = ReviewComment.new(review_comment_params)
    @review_comment.user_id = current_user.id
    @review_comment.review_id = @review.id
    @review_comment.save
    @review_comments = @review.review_comments.order(created_at: :desc)
  end

  def destroy
    @review_comment = ReviewComment.find_by(id: params[:id], review_id: params[:review_id])
    @review_comment.destroy
    @review = Review.find(params[:review_id])
    @review_comments = @review.review_comments.order(created_at: :desc)
  end

  private

  def review_comment_params
    params.require(:review_comment).permit(:comment, :user_id, :review_id)
  end

end

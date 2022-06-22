class Public::ReviewCommentsController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    # 投稿に紐づいたコメントの作成
    @review_comment = @review.review_comments.build(review_comment_params)
    @review_comment.user_id = current_user.id
    @review_comment.save
    render 'public/review_comments/index'
  end

  def destroy
    @review_comment = ReviewComment.find(params[:id])
    @review_comment.destroy
    render 'public/review_comments/index'
  end

  private

  def review_comment_params
    params.require(:review_comment).permit(:comment, :user_id, :review_id)
  end

end

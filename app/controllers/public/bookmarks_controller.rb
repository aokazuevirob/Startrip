class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = Review.find(params[:review_id])
    # userとreviewの紐付け
    @bookmark = @review.bookmarks.new(user_id: current_user.id)
    if @bookmark.save
    else
      redirect_to request.referer
    end
  end

  def destroy
    @review = Review.find(params[:review_id])
    @bookmark = @review.bookmarks.find_by(user_id: current_user.id)
    if @bookmark.present?
      @bookmark.destroy
    else
      redirect_to request.referer
    end
  end

end

class Public::FavoritesController < ApplicationController

  # 非同期通信
  def create
    @review = Review.find(params[:review_id])
    favorite = current_user.favorites.new(review_id: @review.id)
    favorite.save
  end

  # 非同期通信
  def destroy
    @review = Review.find(params[:review_id])
    favorite = current_user.favorites.find_by(review_id: @review.id)
    favorite.destroy
  end

end

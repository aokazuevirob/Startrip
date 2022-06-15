class Public::ReviewsController < ApplicationController
  def new
  end

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
    @user = @review.user
  end

  def edit
  end
end

class Public::ReviewsController < ApplicationController
  def new
    @review = Review.new
    @user = current_user
  end

  def confirm
    @review = Review.new(review_params)
    @user = current_user
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to review_path(@review), notice: "投稿しました！"
    else
      render 'confirm'
    end
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

  private

  def review_params
    params.require(:review).permit(:user_id, :country_id, :country_code, :area, :rate, :title, :body, :travel_cost, :accommodation_fee, :night, :travel_images)
  end

end

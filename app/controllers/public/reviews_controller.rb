class Public::ReviewsController < ApplicationController
  before_action :correct_user, only: [:edit]
  def new
    @review = Review.new
    @user = current_user
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to reviews_path, notice: "投稿しました！"
    else
      render 'new'
    end
  end

  def index
    @reviews = Review.where(status: :published).order('id DESC')
    @review = Review.new

  end

  def show
    @review = Review.find(params[:id])
    @user = @review.user
    @users = User.all
    @review_comment = ReviewComment.new
    # コメントを新着順で表示
    @review_comments = @review.review_comments.order(created_at: :desc)
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to review_path(@review), notice: "編集内容を保存しました"
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :country_id, :country_code, :area, :rate, :title, :body, :departure, :travel_cost, :accommodation_fee, :night, :status, :travel_image)
  end

  def correct_user
    @review = Review.find(params[:id])
    @user = @review.user
    redirect_to(reviews_path) unless @user == current_user
  end

end

class Public::UsersController < ApplicationController
  def show
    @user = current_user
    @reviews = Review.where(status: :published).order("created_at DESC")
  end

  def confirm
    @user = current_user
  end

# 投稿範囲の指定
  def manage
    @user = current_user
    @reviews = @user.reviews.where(status: :draft).order('created_at DESC')
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :nickname, :introduction, :email, :phone_number, :gender, :birth_date, :user_image, :user_bg_image, :is_delete)
  end

end

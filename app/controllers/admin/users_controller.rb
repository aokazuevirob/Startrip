class Admin::UsersController < ApplicationController
  def index
    # ページネーション追加
    @users = User.all.page(params[:page]).per(8)
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.where(status: :published).order("created_at DESC")
  end

  def confirm
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "会員情報を更新しました"
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :nickname, :introduction, :email, :phone_number, :gender, :birth_date, :user_image, :is_deleted)
  end

end

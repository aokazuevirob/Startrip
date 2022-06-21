class Admin::UsersController < ApplicationController
  def index
    @users = User.all
    # ページネーション追加後に変更
    # @users = User.all.page(params[:page]).per(6)
  end

  def show
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
    params.require(:user).permit(:last_name, :first_name, :nickname, :email, :phone_number, :gender, :birth_date, :is_delete, :user_image)
  end

end

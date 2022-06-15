class Public::UsersController < ApplicationController
  def show
    @user = current_user
    @reviews = Review.all
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
    params.require(:user).permit(:last_name, :first_name, :nickname, :email, :phone_number, :gender, :birth_date)
  end

end

class Public::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]
  before_action :authenticate_user!, except: [:show]

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.where(status: :published).order("created_at DESC")
  end

  def confirm
    @user = current_user
  end

  # bookmark一覧の表示
  def bookmark
    @bookmarks = Bookmark.where(user_id: current_user.id)
    @review = Review.find(params[:id])
  end

# 投稿範囲の指定
  def manage
    @user = current_user
    @reviews = @user.reviews.where(status: [:draft, :unpublished]).order('created_at DESC')
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "登録情報の変更を保存しました"
    else
      render 'edit'
    end
  end

  def quit
    @user = current_user
  end

  def out
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :nickname, :introduction, :email, :phone_number, :gender, :birth_date, :user_image, :user_bg_image, :is_deleted)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.last_name == "guest"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end

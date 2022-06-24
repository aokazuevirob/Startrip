# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :user_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to user_path(user), notice: 'guestuserでログインしました。'
  end

  protected

  def user_state
    # userテーブルからemail情報を確認（.dowmcase => 大文字を小文字に変換）
    @user = User.find_by(email: params[:user][:email].downcase)
    # 該当レコードがない場合は処理を終了する
    return if !@user
    # passwordが正しいかつ退会ステータスがtrue(退会済)の場合に実行
      if @user.valid_password?(params[:user][:password]) && @user.is_deleted == true
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_user_registration_path
      end
  end


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

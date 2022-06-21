class ApplicationController < ActionController::Base

  # URLに'/admin'が含まれるページはadminログイン時以外接続不可
  # before_action :authenticate_admin!, if: :admin_url
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def admin_url
  #   request.fullpath.include?("/admin")
  # end

  private
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      admin_users_path
    else
      user_path(current_user)
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :nickname, :email, :password, :password_confirmation, :phone_number, :gender, :birth_date])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end

end

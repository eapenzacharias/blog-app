# frozen_string_literal: true

# added current_user method
class ApplicationController < ActionController::Base
  add_flash_types :red, :cyan
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :bio, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :bio, :email, :password, :current_password, :password_confirmation)}
  end

 private

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path if resource_or_scope == :user
  end

  def after_sign_up_path_for(resource_or_scope)
    new_user_session_path
  end
end

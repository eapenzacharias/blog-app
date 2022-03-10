# frozen_string_literal: true

# added current_user method
class ApplicationController < ActionController::Base
  add_flash_types :danger, :info, :warning, :success

  def current_user
    User.first
  end

  @current_user = User.first
end

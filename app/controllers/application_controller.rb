# frozen_string_literal: true

# added current_user method
class ApplicationController < ActionController::Base
  def current_user
    User.first
  end
end

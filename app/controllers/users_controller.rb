# frozen_string_literal: true

# List and display user
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user_id = params[:id]
  end
end

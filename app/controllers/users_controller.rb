# frozen_string_literal: true

# List and display user
class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @current_user = current_user
    @post = Post.new
  end

  def show
    @current_user = current_user
    @user = @current_user
    @posts = @user.recent_posts.includes(:comments)
  end
end

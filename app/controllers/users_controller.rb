# frozen_string_literal: true

# List and display user
class UsersController < ApplicationController
  def index
    @users = User.all
    @current_user = current_user
    @post = Post.new
  end

  def show
    @user = User.find(params[:id])
    @posts = @user&.recent_posts || 'No posts'
    @current_user = current_user
  end
end

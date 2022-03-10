# frozen_string_literal: true

# List and display posts from a user
class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    @current_user = current_user
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @current_user = current_user
    @comment = Comment.new
  end

  def new
    @current_user = current_user
    @post = Post.new
    @user = current_user
  end

  def create
    @current_user = current_user
    @post = @current_user.posts.new(post_params)
    if @post.save
      redirect_to user_path(@current_user.id), success: 'Post was successfully created'
    else
      flash.now[:danger] = 'Post was not created'
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:title, :text, :user_id)
  end
end

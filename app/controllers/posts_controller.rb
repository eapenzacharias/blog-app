# frozen_string_literal: true

# List and display posts from a user
class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
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
      redirect_to user_path(@current_user.id), cyan: 'thought posted.'
    else
      flash.now[:red] = @post.errors.full_messages.join(', ')
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash.now[:success] = 'post deleted.'
    redirect_to user_path(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text, :user_id)
  end
end

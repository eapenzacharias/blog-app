# frozen_string_literal: true

# List and display posts from a user
class PostsController < ApplicationController
  def index; end

  def show
    @user_id = params[:user_id]
    @post_id = params[:id]
  end
end

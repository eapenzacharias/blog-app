# frozen_string_literal: true

# handels comment creation
class CommentsController < ApplicationController
  def new
    @current_user = current_user
    @post_id = params[:post_id]
    @comment = Comment.new
  end

  def create
    @current_user = current_user
    @post_id = params[:post_id]
    comment = Comment.new(comment_params.merge(author: @current_user, post_id: @post_id))
    if comment.save
      redirect_to user_post_path(@current_user.id, @post_id), cyan: 'your view is noted!'
    else
      flash.now[:red] = 'comment not posted!'
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

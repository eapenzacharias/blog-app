# frozen_string_literal: true

# handels like creation
class LikesController < ApplicationController
  def create
    @post_id = params[:post_id]
    @current_user = current_user

    if liked?
      flash[:red] = 'not again!'
    else
      Like.create(author: current_user, post_id: @post_id)
      flash[:cyan] = 'glad that you found it interesting!'
    end
    redirect_back(fallback_location: root_path)
  end

  def liked?
    Like.find_by(author: @current_user, post_id: @post_id).present?
  end
end

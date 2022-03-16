# frozen_string_literal: true

# Comments model
class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  after_save :update_comments_counter

  after_destroy :update_comment_counter

  def update_comments_counter
    post.update(comments_counter: post.comments.length)
  end
end

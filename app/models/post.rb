# frozen_string_literal: true

# Post model
class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_update :update_posts_counter

  private
  def update_posts_counter
    author.update(posts_counter: author.posts.length)
    p "counter #{author.posts_counter}"
    p "post_length  #{author.posts.length}"
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end

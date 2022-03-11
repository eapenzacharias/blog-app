# frozen_string_literal: true

# Post model
class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_update :update_posts_counter

  private

  def update_posts_counter
    author.update(posts_counter: author.posts.length)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end

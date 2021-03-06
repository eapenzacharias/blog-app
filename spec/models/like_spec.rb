# frozen_string_literal: true

require 'rails_helper'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.describe Like, type: :model do
  before do
    DatabaseCleaner.clean
    @user = User.create(id: 1, name: 'User', email: 'test65@test.com', password: 'test1234',
                        password_confirmation: 'test1234', confirmed_at: Time.now)
    @post = Post.create(id: 1, title: 'Post', author_id: @user.id, text: 'post content')
  end

  it 'should increment likes_counter' do
    Like.create(author_id: 1, post_id: 1)
    expect(Post.find(1).likes_counter).to eq 1
  end
end

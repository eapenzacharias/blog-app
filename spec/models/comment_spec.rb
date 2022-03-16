# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = User.create(id: 1, name: 'User', email: 'test65@test.com', password: 'test1234',
                        password_confirmation: 'test1234', confirmed_at: Time.now)
    @post = Post.create(id: 1, title: 'Post', author_id: @user.id, text: 'post content')
  end

  it 'should increment comments_counter' do
    Comment.create(text: 'first comment', author_id: 1, post_id: 1)
    expect(Post.find(1).comments_counter).to eq 1
  end
end

require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'User')
  post = Post.create(title: 'Post', author: user, text: 'post content')

  it 'should increment likes_counter' do
    Like.create(author: user, post: post)
    expect(post.likes_counter).to eq 1
  end
end
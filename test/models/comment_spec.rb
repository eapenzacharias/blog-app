require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'User')
  post = Post.create(title: 'Post', author: user, text: 'post content')

  it 'should increment comments_counter' do
    Comment.create(text: 'first comment', author: user, post: post)
    expect(post.comments_counter).to eq 1
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do # rubocop:disable Metrics/BlockLength

  # post = Post.create(title: 'Post', author_id: user.id, text: 'post content')
  before { @user = User.create(id: 1, name: 'User', email: 'test5@test.com', password: 'test1234', password_confirmation: 'test1234', confirmed_at: Time.now) }
  subject do
    Post.new(title: 'Post', text: 'post content', author_id: 1)
  end

  before { subject.save }

  it 'should have a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'should have a title with length less than 250' do
    subject.title = '0' * 251
    expect(subject).to_not be_valid
  end

  it 'should have a user' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'should have a comments_counter' do
    subject.comments_counter = nil
    expect(subject).to_not be_valid
  end

  it 'should have a likes_counter' do
    subject.likes_counter = nil
    expect(subject).to_not be_valid
  end

  it 'should have a comments_counter greater than or equal to 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'should have a likes_counter greater than or equal to 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  describe '#recent_comments' do
    it 'should return 5 recent comments' do
      subject.save
      subject.comments << Comment.create(text: 'comment 1', author_id: 1)
      subject.comments << Comment.create(text: 'comment 2', author_id: 1)
      subject.comments << Comment.create(text: 'comment 3', author_id: 1)
      subject.comments << Comment.create(text: 'comment 4', author_id: 1)
      subject.comments << Comment.create(text: 'comment 5', author_id: 1)
      subject.comments << Comment.create(text: 'comment 6', author_id: 1)
      subject.comments << Comment.create(text: 'comment 7', author_id: 1)
      expect(subject.recent_comments.length).to eq(5)
    end
  end
end

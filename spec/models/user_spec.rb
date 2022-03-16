# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do # rubocop:disable Metrics/BlockLength
  subject do
    User.new(name: 'User', email: 'test6@test.com', password: 'test1234', password_confirmation: 'test1234',
             confirmed_at: Time.now)
  end

  before { subject.save }

  it 'should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have a posts_counter' do
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end

  it 'should have a posts_counter greater than or equal to 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'should have a posts_counter as integer' do
    subject.posts_counter = 0.1
    expect(subject).to_not be_valid
  end

  describe '#recent_posts' do
    it 'should return recent 3 posts' do
      subject.save
      subject.posts << Post.create(title: 'Post 1', text: 'Post content')
      subject.posts << Post.create(title: 'Post 2', text: 'Post content')
      subject.posts << Post.create(title: 'Post 3', text: 'Post content')
      subject.posts << Post.create(title: 'Post 4', text: 'Post content')
      subject.posts << Post.create(title: 'Post 5', text: 'Post content')
      expect(subject.recent_posts.length).to eq 3
    end
  end
end

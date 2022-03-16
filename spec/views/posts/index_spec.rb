# frozen_string_literal: true

require 'rails_helper'
require 'capybara/rspec'

RSpec.describe Post, type: :feature do  # rubocop:disable Metrics/BlockLength
  before :each do
    User.create(id: 1, name: 'User One', email: 'user1@test.com', password: '123456789', password_confirmation: '123456789',
                bio: 'bio for 1', confirmed_at: Time.now)
    Post.create(id: 1, title: 'post a', text: 'post content 1', author_id: 1)
    Post.create(id: 2, title: 'post b', text: 'post content 2', author_id: 1)
    Post.create(id: 3, title: 'post c', text: 'post content 3', author_id: 1)
    Post.create(id: 4, title: 'post d', text: 'post content 4', author_id: 1)

    Comment.create(id: 1, text: 'comment a', author_id: 1, post_id: 1)
    Comment.create(id: 2, text: 'comment b', author_id: 1, post_id: 1)
    Comment.create(id: 3, text: 'comment c', author_id: 1, post_id: 1)

    Like.create(id: 1, author_id: 1, post_id: 1)
    Like.create(id: 2, author_id: 1, post_id: 1)
  end

  describe 'when visiting the Post#index page for User 1' do
    before :each do
      visit '/login'
      fill_in 'your email id', with: 'user1@test.com'
      fill_in 'your password', with: '123456789'
      click_button 'Log in'
      visit '/users/1/posts'
    end

    it 'should have user name' do
      expect(page).to have_text('User One')
    end

    it 'should have post counter with 0' do
      expect(page).to have_text('posts: 4')
    end

    it 'should display all posts' do
      expect(page).to have_text('post a')
      expect(page).to have_text('post b')
      expect(page).to have_text('post c')
      expect(page).to have_text('post d')
    end

    it 'should display comments' do
      expect(page).to have_text('comment a')
      expect(page).to have_text('comment b')
      expect(page).to have_text('comment c')
    end

    it 'should have comments and likes counter' do
      expect(page).to have_text('3')
      expect(page).to have_text('2')
    end

    it "should open correct post when clicked" do
      click_on('post a', match: :first)
      expect(page).to have_text('post#1 by User One.')
      expect(page).to have_text('post a')
    end
  end
end
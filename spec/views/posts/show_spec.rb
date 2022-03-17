# frozen_string_literal: true

require 'rails_helper'
require 'capybara/rspec'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.describe Post, type: :feature do # rubocop:disable Metrics/BlockLength
  before :each do
    DatabaseCleaner.clean
    User.create(id: 1, name: 'User One', email: 'user1@test.com', password: '123456789',
                password_confirmation: '123456789',
                bio: 'bio for 1', confirmed_at: Time.now)
    Post.create(id: 1, title: 'post a', text: 'post content a', author_id: 1)

    Comment.create(id: 1, text: 'comment a', author_id: 1, post_id: 1)
    Comment.create(id: 2, text: 'comment b', author_id: 1, post_id: 1)
    Comment.create(id: 3, text: 'comment c', author_id: 1, post_id: 1)

    Like.create(id: 1, author_id: 1, post_id: 1)
    Like.create(id: 2, author_id: 1, post_id: 1)
  end

  describe 'when visiting the Post#index page for User 1' do # rubocop:disable Metrics/BlockLength
    before :each do
      visit '/login'
      fill_in 'your email id', with: 'user1@test.com'
      fill_in 'your password', with: '123456789'
      click_button 'Log in'
      visit '/users/1/posts/1'
    end

    it 'should have user name' do
      expect(page).to have_text('post#1 by User One.')
    end

    it 'should have post title' do
      expect(page).to have_text('post a')
    end

    it 'should have post body' do
      expect(page).to have_text('post content a')
    end

    it 'should display all comments' do
      expect(page).to have_text('comment a')
      expect(page).to have_text('comment b')
      expect(page).to have_text('comment c')
    end

    it 'should display user name of commenters' do
      expect(page).to have_text('User One:')
    end

    it 'should have comments and likes counter' do
      expect(page).to have_text('3')
      expect(page).to have_text('2')
    end

    it 'should have delete buttons for post and comments' do
      expect(page).to have_button('Delete', count: 4)
    end
  end
end

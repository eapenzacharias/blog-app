# frozen_string_literal: true

require 'rails_helper'
require 'capybara/rspec'

RSpec.describe User, type: :feature do # rubocop:disable Metrics/BlockLength
  before :each do
    User.create(name: 'User 1', email: 'user1@test.com', password: '123456789', password_confirmation: '123456789',
                bio: 'bio for 1', confirmed_at: Time.now)
    User.create(name: 'User 2', email: 'user2@test.com', password: '123456789', password_confirmation: '123456789',
                bio: 'bio for 2', confirmed_at: Time.now)
    User.create(name: 'User 3', email: 'user3@test.com', password: '123456789', password_confirmation: '123456789',
                bio: 'bio for 3', confirmed_at: Time.now)
  end

  describe 'when visiting the User#index page' do # rubocop:disable Metrics/BlockLength
    before :each do
      visit '/login'
      fill_in 'your email id', with: 'user1@test.com'
      fill_in 'your password', with: '123456789'
      click_button 'Log in'
      visit '/users'
    end

    it 'should have welcome message for current user' do
      expect(page).to have_text('Hello User 1!')
    end

    it 'should have new post form fields' do
      expect(page).to have_field("what's on your mind?")
      expect(page).to have_field('now describe that thought.')
    end

    it 'should have all the usernames.' do
      expect(page).to have_text('User 1')
      expect(page).to have_text('User 2')
      expect(page).to have_text('User 3')
    end

    it 'should have default profle picture.' do
      expect(page).to have_css('img')
    end

    it 'should show number of posts all users.' do
      expect(page).to have_text('posts: 0')
    end

    it 'should redirect to user profile when clicked' do
      click_link('User 1', match: :first)
      expect(page).to have_text('bio.')
    end
  end
end

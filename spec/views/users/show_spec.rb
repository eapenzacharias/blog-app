# frozen_string_literal: true

require 'rails_helper'
require 'capybara/rspec'

RSpec.describe User, type: :feature do  # rubocop:disable Metrics/BlockLength
  before :each do
    User.create(id: 1, name: 'User 1', email: 'user1@test.com', password: '123456789', password_confirmation: '123456789',
                bio: 'bio for 1', confirmed_at: Time.now)
    Post.create(id: 1, title: 'post 1', text: 'post content 1', author_id: 1)
    Post.create(id: 2, title: 'post 2', text: 'post content 2', author_id: 1)
    Post.create(id: 3, title: 'post 3', text: 'post content 3', author_id: 1)
    Post.create(id: 4, title: 'post 4', text: 'post content 4', author_id: 1)
  end

  describe 'when visiting the User#index page' do
    before :each do
      visit '/login'
      fill_in 'your email id', with: 'user1@test.com'
      fill_in 'your password', with: '123456789'
      click_button 'Log in'
      visit '/users/1'
    end
    it 'should have user name' do
      expect(page).to have_text('User 1')
    end

    it 'should have post counter with 0' do
      expect(page).to have_text('posts: 4')
    end

    it 'should have bio section' do
      expect(page).to have_text('bio.')
      expect(page).to have_text('bio for 1')
    end

    it 'should have recent posts section' do
      expect(page).to have_text('recent posts.')
    end

    it 'should display 3 recent posts' do
      expect(page).to have_text('post 4')
      expect(page).to have_text('post 3')
      expect(page).to have_text('post 2')
    end

    it 'should only display 3 recent posts' do
      expect(page).not_to have_text('post 1')
    end

    it 'should have link to see all posts' do
      expect(page).to have_link('see all posts.')
    end

    it 'should open correct post when clicked' do
      click_on('post 4', match: :first)
      expect(page).to have_text('post#4 by User 1.')
      expect(page).to have_text('post 4')
    end
  end
end
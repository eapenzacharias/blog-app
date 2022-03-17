# frozen_string_literal: true

require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Login' do # rubocop:disable Metrics/BlockLength
  before :each do
    User.create(name: 'User', email: 'user@test.com', password: '123456789', password_confirmation: '123456789',
                confirmed_at: Time.now)
  end

  describe 'When visiting log in page', type: :feature do
    before :each do
      visit '/login'
    end
    it 'should have email field' do
      expect(page).to have_field('your email id')
    end

    it 'should have password field' do
      expect(page).to have_field('your password')
    end

    it 'should have log in button' do
      expect(page).to have_button('Log in')
    end
  end
  describe 'When clicking on log in button', type: :feature do
    before :each do
      visit '/login'
    end

    it 'should flash error message when empty login details are submitted' do
      click_button 'Log in'
      expect(page).to have_text('Invalid Email or password.')
    end

    it 'should flash error message when incorrect login details are submitted' do
      fill_in 'your email id', with: 'a@a.com'
      fill_in 'your password', with: '987654321'
      click_button 'Log in'
      expect(page).to have_text('Invalid Email or password.')
    end

    it 'should login when correct login details are submitted' do
      fill_in 'your email id', with: 'user@test.com'
      fill_in 'your password', with: '123456789'
      click_button 'Log in'
      expect(page).to have_text('Signed in successfully.')
      expect(page).to have_text('Hello User!')
    end
  end
end

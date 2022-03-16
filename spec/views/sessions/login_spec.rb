# frozen_string_literal: true

require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Login' do
  before :each do
    User.create(name: 'User', email: 'user@test.com', password: '123456789', password_confirmation: '123456789', confirmed_at: Time.now)
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
end
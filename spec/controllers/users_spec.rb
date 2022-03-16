# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    User.create(name: 'user1', photo: 'photo.jpg', bio: 'bio')
    before(:example) { get '/users' }
    it 'Should have http status ok' do
      expect(response).to have_http_status(:ok)
    end
    it 'should render user index page' do
      expect(response.body).to render_template(:index)
    end
  end
  describe 'GET /show' do
    before(:example) { get '/users/1' }
    it 'Should have http status ok' do
      expect(response).to have_http_status(:ok)
    end
    it 'should render user index page' do
      expect(response.body).to render_template(:show)
      expect(response.body).to include('user1')
    end
  end
end
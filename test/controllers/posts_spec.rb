# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users/sample_user'}
    it 'Should have http status ok' do
      expect(response).to have_http_status(:ok)
    end
    it 'should render posts index page for a user' do
      expect(response.body).to include('User: sample_user')
    end
  end
  describe 'GET /show' do
    before(:example) { get '/users/sample_user/posts/post_id'}
    it 'Should have http status ok' do
      expect(response).to have_http_status(:ok)
    end
    it 'should render post index page for given user' do
      expect(response.body).to include('Post: post_id User: sample_user')
    end
  end
end

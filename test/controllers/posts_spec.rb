# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users/sample_user/posts' }
    it 'Should have http status ok' do
      expect(response).to have_http_status(:ok)
    end
    it 'should render posts index page for a user' do
      expect(response.body).to render_template(:index)
      expect(response.body).to include('User id: sample_user')
    end
  end
  describe 'GET /show' do
    before(:example) { get '/users/sample_user/posts/post_id' }
    it 'Should have http status ok' do
      expect(response).to have_http_status(:ok)
    end
    it 'should render specific post page for given user' do
      expect(response.body).to render_template(:show)
      expect(response.body).to include('Post: post_id User: sample_user')
    end
  end
end

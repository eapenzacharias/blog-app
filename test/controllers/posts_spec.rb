# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    user = User.create(name: 'user1', photo: 'photo.jpg', bio: 'bio')
    Post.create(author: user, title: 'Post 1', text: 'post text')
    before(:example) { get '/users/1/posts' }
    it 'Should have http status ok' do
      expect(response).to have_http_status(:ok)
    end
    it 'should render posts index page for a user' do
      expect(response.body).to render_template(:index)
      expect(response.body).to include('user1')
    end
  end
  describe 'GET /show' do
    before(:example) { get '/users/1/posts/1' }
    it 'Should have http status ok' do
      expect(response).to have_http_status(:ok)
    end
    it 'should render specific post page for given user' do
      expect(response.body).to render_template(:show)
      expect(response.body).to include('Post 1')
    end
  end
end

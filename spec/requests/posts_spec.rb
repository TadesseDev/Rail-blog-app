require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'posts GET /index' do
    before(:example) { get('/users/:user_id/posts') }
    it 'response is ok for index' do
      assert_response :ok
    end
    it 'render the right page' do
      expect(response).to render_template(:index)
    end

    it 'user/posts containes place holder text' do
      expect(response.body).to match('this is a post index')
    end
  end
  describe 'posts show action tests' do
    before(:example) { get('/users/:user_id/posts/:id') }
    it 'response is ok for show' do
      expect(response).to have_http_status(:ok)
    end
    it 'render show template' do
      expect(response).to render_template(:show)
    end

    it 'user/posts/id containes place holder text' do
      expect(response.body).to include('post with ID')
    end
  end
end

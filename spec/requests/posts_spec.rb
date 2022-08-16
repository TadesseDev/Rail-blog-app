require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /index" do
    before(:example) {get users_path}
    it "response is ok for index" do
      expect(response).to have_http_status(:ok)
    end
  end
  describe "show action" do
    it "response is ok for show" do
      get ("/users/:user_id/posts/:id")
      expect(response).to have_http_status(:ok)
    end
  end

end

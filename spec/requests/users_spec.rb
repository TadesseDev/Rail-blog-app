require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "User index page" do
    # before(:example){visit users_path}
    it "I can see the username of all other users" do
      visit users_path
      User.all.each do |user|
        expect(page).to have_content(user.name)
      end
    end
  end
end

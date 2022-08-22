require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "User index page" do
    before(:example){visit users_path}
    before(:all){@users= User.all}
    it "I can see the username of all other users" do
      @users.each do |user|
        expect(page).to have_content(user.name)
      end
    end
    it "I can see the profile picture for each user." do
      @users.each do |user|
        expect(page).to have_xpath("//img[@src='#{user.photo}']")
      end
    end


    it "I can see the number of posts each user has written." do
      @users.each do |user|
        expect(page).to have_content(user.postCount)
      end
    end

      it "When I click on a user, I am redirected to that user's show page." do
      @users.each do |user|
        find(:xpath, "//a[@href='/users/#{user.id}']").click
        expect(page).to have_current_path("/users/#{user.id}")
        visit users_path
      end
  end

end

end

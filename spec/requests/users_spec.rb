require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'User index page' do
    before(:example) { visit users_path }
    before(:all) { @users = User.all }
    it 'I can see the username of all other users' do
      @users.each do |user|
        expect(page).to have_content(user.name)
      end
    end
    it 'I can see the profile picture for each user.' do
      @users.each do |user|
        expect(page).to have_xpath("//img[@src='#{user.photo}']")
      end
    end

    it 'I can see the number of posts each user has written.' do
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

  describe 'User index page' do
    before(:example) { visit user_path(1) }
    before(:all) { @user = User.find 1 }
    it "I can see the user's profile picture." do
      expect(page).to have_xpath("//img[@src='#{@user.photo}']")
    end
    it "I can see the user's username." do
      expect(page).to have_content(@user.name)
    end
    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content("Number of Posts: #{@user.postCount}")
    end
    it "I can see the user's bio." do
      expect(page).to have_content(@user.bio)
    end
    it "I can see the user's first 3 posts." do
      @user.posts.order(created_at: :desc).limit(3).each do |post|
        expect(page).to have_content(post.title)
      end
    end
    it "I can see a button that lets me view all of a user's posts." do
      expect(page).to have_content('See all posts')
    end
    it "When I click a user's post, it redirects me to that post's show page." do
      @user.posts.order(created_at: :desc).limit(3).each do |post|
        find(:xpath, "//a[@href='/users/#{@user.id}/posts/#{post.id}']").click
        expect(page).to have_current_path("/users/#{@user.id}/posts/#{post.id}")
        visit user_path(@user)
      end
    end
    it "When I click to see all posts, it redirects me to the user's post's index page." do
      click_link('See all posts')
      expect(page).to have_current_path("/users/#{@user.id}/posts")
    end
  end
end

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'User post index page' do
    before(:example) { visit user_posts_path(1) }
    before(:all) do
      @user = User.find(1)
    end
    it "I can see the user's profile picture." do
      expect(page).to have_xpath("//img[@src='#{@user.photo}']")
    end
    it "I can see the user's username." do
      expect(page).to have_content(@user.name)
    end
    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content("Number of Posts: #{@user.postCount}")
    end
    it "I can see a post's title." do
      @user.posts.each do |post|
        expect(page).to have_content(post.title)
      end
    end
    it "I can see some of the post's body." do
      @user.posts.each do |post|
        expect(page).to have_content(post.text[0..100])
      end
    end
    it 'I can see the first comments on a post.' do
      @user.posts.each do |post|
        first_comment = post.comments.order(created_at: :desc).first
        expect(page).to have_content(first_comment.text) unless first_comment.nil?
      end
    end
    it 'I can see how many comments a post has.' do
      @user.posts.each do |post|
        expect(page).to have_content("comments: #{post.commentsCount}")
      end
    end
    it 'I can see how many likes a post has.' do
      @user.posts.each do |post|
        expect(page).to have_content("Likes: #{post.likesCount}")
      end
    end
    it 'I can see a section for pagination if there are more posts than fit on the view.' do
      expect(page).to have_content('Pagination')
    end
    it "When I click on a post, it redirects me to that post's show page." do
      @user.posts.each do |post|
        find(:xpath, "//a[@href='/users/#{@user.id}/posts/#{post.id}']").click
        expect(page).to have_current_path("/users/#{@user.id}/posts/#{post.id}")
        visit user_posts_path(@user)
      end
    end
  end

  describe 'Post show page' do
    before(:example) { visit users_path }
    before(:all) do
      @post = Post.find 1
      @user = @post.user
    end
    it "I can see the post's title." do
    end
    it 'I can see who wrote the post.' do
    end
    it 'I can see how many comments it has.' do
    end
    it 'I can see how many likes it has.' do
    end
    it 'I can see the post body.' do
    end
    it 'I can see the username of each commentor.' do
    end
    it 'I can see the comment each commentor left.' do
    end
  end
end

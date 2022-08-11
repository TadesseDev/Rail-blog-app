require 'rails_helper'

RSpec.describe Comment, type: :model do
  valid_user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                        postCount: 1)
  valid_post = Post.new(user: valid_user, title: 'title', text: 'this is post text', commentsCount: 11,
                        likesCount: 1)
  comment = Comment.new(user: valid_user, post: valid_post, text: 'Hi Tom!')

  context 'test valid comment' do
    it 'creates a valid comment with valid information' do
      expect(comment).to be_valid
    end
  end

  context 'save and retrive valid comment' do
    it 'save valid comment and retirive it from database' do
      comment.save
      expect(Comment.find(comment.id)).to be_an_instance_of(Comment)
    end
  end
end

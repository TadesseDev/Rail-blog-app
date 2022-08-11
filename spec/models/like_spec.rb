require 'rails_helper'

RSpec.describe Like, type: :model do
  valid_user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                        postCount: 1)
  valid_post = Post.new(user: valid_user, title: 'title', text: 'this is post text', commentsCount: 11,
                        likesCount: 1)
  like = Like.new(user: valid_user, post: valid_post)

  context 'test valid like' do
    it 'creates a valid like with valid information' do
      expect(like).to be_valid
    end
  end

  context 'save and retrive valid like' do
    it 'save valid like and retirive it from database' do
      like.save
      expect(Like.find(like.id)).to be_an_instance_of(Like)
    end
  end
end

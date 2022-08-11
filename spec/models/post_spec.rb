require 'rails_helper'

RSpec.describe Post, type: :model do
  valid_title = 'title text'
  invalid_title = 'title text' * 250
  valid_user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                        postCount: 1)
  valid_post = Post.new(user: valid_user, title: valid_title, text: 'this is post text', commentsCount: 11,
                        likesCount: 1)
  invalid_title_post = Post.new(user: valid_user, title: invalid_title, text: 'this is post text', commentsCount: 11,
                                likesCount: 1)
  invalid_no_title_post = Post.new(user: valid_user, text: 'this is post text', commentsCount: 11, likesCount: 1)
  invalid_coment_count_type_post = Post.new(user: valid_user, title: valid_title, text: 'this is post text',
                                            commentsCount: 'sting', likesCount: 1)
  invalid_coment_count_negative_post = Post.new(user: valid_user, title: valid_title, text: 'this is post text',
                                                commentsCount: -11, likesCount: 1)
  invalid_like_count_type_post = Post.new(user: valid_user, title: valid_title, text: 'this is post text',
                                          commentsCount: 11, likesCount: 'string')
  invalid_like_count_negative_post = Post.new(user: valid_user, title: valid_title, text: 'this is post text',
                                              commentsCount: 11, likesCount: -1)
  context 'test valid posts' do
    it 'creates a valid post with valid information' do
      expect(valid_post).to be_valid
    end
  end
  context 'test invalid posts' do
    it 'fails to validate post without title longer than 250' do
      expect(invalid_title_post).not_to be_valid
    end

    it 'fails to validate post without title' do
      expect(invalid_no_title_post).not_to be_valid
    end

    it 'fails to validate post without string comment_count value' do
      expect(invalid_coment_count_type_post).not_to be_valid
    end

    it 'fails to validate post without negative comment_count value' do
      expect(invalid_coment_count_negative_post).not_to be_valid
    end

    it 'fails to validate post without string like_count value' do
      expect(invalid_like_count_type_post).not_to be_valid
    end

    it 'fails to validate post without negative like_count value' do
      expect(invalid_like_count_negative_post).not_to be_valid
    end
  end

  context 'most recent comment method works as expected' do
    post = Post.first
    it 'it returns a valid type' do
      recent_comment = Post.most_recent_comments(post)
      expect(recent_comment.length).to be_a_kind_of(Integer)
    end
  end
end

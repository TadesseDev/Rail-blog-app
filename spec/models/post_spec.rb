require 'rails_helper'

RSpec.describe Post, type: :model do
  valid_Title='title text'
  invalid_Title='title text'*250
  valid_user=User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.' , postCount: 1);
  valid_post = Post.new(user: valid_user, title: valid_Title, text: 'this is post text', commentsCount: 11,likesCount: 1)
  invalid_no_title_post = Post.new(user: valid_user, text: 'this is post text', commentsCount: 11,likesCount: 1)
  invalid_comentCont_type_post = Post.new(user: valid_user, title: valid_Title, text: 'this is post text', commentsCount: 'sting',likesCount: 1)
  invalid_comentCont_negative_post = Post.new(user: valid_user, title: valid_Title, text: 'this is post text', commentsCount: -11,likesCount: 1)
  invalid_likeCont_type_post = Post.new(user: valid_user, title: valid_Title, text: 'this is post text', commentsCount: 11,likesCount: 'string')
  invalid_likeCont_negative_post = Post.new(user: valid_user, title: valid_Title, text: 'this is post text', commentsCount: 11,likesCount: -1)
    context "text valid posts" do
      it "creates a valid post with valid information" do
        expect(valid_post).to be_valid
    end

    end
    context "test invalid posts" do
      it "fails to validate post without title" do
        expect(invalid_no_title_post).not_to be_valid
      end

      it "fails to validate post without string comment_count value" do
        expect(invalid_comentCont_type_post).not_to be_valid
      end

      it "fails to validate post without negative comment_count value" do
        expect(invalid_comentCont_negative_post).not_to be_valid
      end

      it "fails to validate post without string like_count value" do
        expect(invalid_likeCont_type_post).not_to be_valid
      end


      it "fails to validate post without negative like_count value" do
        expect(invalid_likeCont_negative_post).not_to be_valid
      end
    end


end

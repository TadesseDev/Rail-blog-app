class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def self.update_post_counter(user)
    user.update(postCount: Post.where(user: user).count)
  end

  def self.most_recent_comments(post)
    Comment.where(post: post).order(created_at: :DESC).limit(5)
  end
end

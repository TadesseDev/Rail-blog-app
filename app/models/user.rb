class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  validates :name, presence: true
  def self.most_recent_posts(user)
    Post.where(user: user).order(created_at: :desc).limit(3)
  end
end

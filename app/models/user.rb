class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :Confirmable
  has_many :posts
  has_many :comments
  has_many :likes

  validates :name, presence: true
  validates :postCount, numericality: { only_integer: true }
  validates_comparison_of :postCount, greater_than_or_equal_to: 0
  def self.most_recent_posts(user)
    Post.includes(:user).where(posts: { user: user }).order(created_at: :desc).limit(3)
  end
end

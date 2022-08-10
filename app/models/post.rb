class Post < ApplicationRecord
  belongs_to :user
  hase_many :comments
  hase_many :likes
end

class User < ApplicationRecord
  hase_many :posts
  hase_many :comments
  hase_many :likes

end

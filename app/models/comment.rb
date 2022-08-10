class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.update_comment_counter(post)
    post.update(commentsCount: Comment.where(post: post).count)
  end
end

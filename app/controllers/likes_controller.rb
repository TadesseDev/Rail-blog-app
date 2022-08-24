class LikesController < ApplicationController
  def create
    post = Post.where(id: params[:post_id]).first
    user = current_user
    return if Like.like_exists?(user, post)

    Like.create(user: user, post: post)
  end

  def index; end
end

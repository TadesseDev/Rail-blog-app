class LikesController < ApplicationController
  def create
    post = Post.where(id: params[:post_id]).first
    user = current_user
    return if Like.where(user: user, post: post).length.positive?

    Like.create(user: user, post: post)
  end

  def index; end
end

class LikesController < ApplicationController

  def create
    post=Post.where(id: params[:post_id]).first
    user=current_user
    puts 'this is the find result'
    puts  Like.where(user: user, post: post).length
    return if Like.where(user: user, post: post).length>0
    puts 'saving likes'
    Like.create(user: user, post: post)
  end

  def index
  end
end

class LikesController < ApplicationController
  def new
    @like=Like.new
  end

  def create
    Likes.create(user: current_user,post: Post.where(id: params[:user_id]))
  end

  def index
  end
end

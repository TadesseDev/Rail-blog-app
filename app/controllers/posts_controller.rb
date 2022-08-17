class PostsController < ApplicationController
  def index
    puts params[:id]
    @posts=Post.where(user_id: params[:user_id])
  end
  def show; end
end

class PostsController < ApplicationController
  helper_method :get_top_comments
  def index
    @user = User.where(id: params[:user_id]).first
    @posts = Post.where(user_id: params[:user_id])
  end

  def show
    puts params
    @post = Post.where(id: params[:id]).first
  end

  def get_top_comments(post)
    Post.most_recent_comments(post)
  end
end

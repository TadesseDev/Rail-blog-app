class PostsController < ApplicationController
  helper_method :get_top_comments
  def index
    @user = User.where(id: params[:user_id]).first
    @posts = Post.includes(:user).where(posts: { user_id: params[:user_id] })
  end

  def show
    @post = Post.where(id: params[:id]).first
  end

  def new
    @post = Post.new
  end

  def create
    permit = post_permit
    Post.create(user: current_user, title: permit[:title], text: permit[:text], commentsCount: 0, likesCount: 0)
  end

  def get_top_comments(post)
    Post.most_recent_comments(post)
  end

  private

  def post_permit
    params.require(:post).permit(:title, :text)
  end
end

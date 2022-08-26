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
    redirect_to user_path(current_user)
  end

  def destroy
     @post=Post.where(id: params[:id].to_i).first
     return unless can? :delete, @post
    Comment.where(post: @post).destroy_all
    Like.where(post: @post).destroy_all
    @post.destroy
    redirect_to user_posts_path
  end

  def get_top_comments(post)
    Post.most_recent_comments(post)
  end

  private

  def post_permit
    params.require(:post).permit(:title, :text)
  end
end

class CommentsController < ApplicationController
  def index; end

  def new
    @comment = Comment.new
  end

  def create
    permits = save_comment
    @comment = Comment.new(user: current_user, post: Post.where(id: params[:post_id]).first, text: permits[:text])
    puts @comment.save!
    redirect_to user_post_path(current_user, params[:post_id])
  end

  def destroy
     @comment=Post.where(id: params[:comment_id].to_i).first
     return unless can? :delete, @comment
    @post.destroy
    redirect_to user_post_path
  end

  private

  def save_comment
    params.require(:comment).permit(:text)
  end
end

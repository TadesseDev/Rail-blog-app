class CommentsController < ApplicationController
  def index; end
  def new
    @user=current_user
    @post=Post.first
    @comment=Comment.new
  end

  def create
    permits=params.require(:comment).permit(:text)
    @comment=Comment.new(user: current_user,post: Post.where(id: params[:post_id]).first,text: permits[:text])
    puts @comment.save!
  end
  private
  # def save_comment
  #   params.require(:comments).permit(:user,:post,:text)
  # end
end

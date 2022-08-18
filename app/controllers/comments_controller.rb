class CommentsController < ApplicationController
  def index; end
  def new
    @comment=Comment.new
  end

  def create
    permits=save_comment
    @comment=Comment.new(user: current_user,post: Post.where(id: params[:post_id]).first,text: permits[:text])
    puts @comment.save!
  end
  private
  def save_comment
    params.require(:comment).permit(:text)
  end
end

class UsersController < ApplicationController
  def index
    redirect_to new_user_session_path unless user_signed_in?
    @users = User.all
  end

  def show
    @user = User.where(id: params[:id]).first
    @posts = User.most_recent_posts(@user)
  end
end

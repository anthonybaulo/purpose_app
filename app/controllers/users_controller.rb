class UsersController < ApplicationController
  
  def home
    @user = current_user
  end
  
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @mission_statements = @user.mission_statements
  end

  def following
    @user = User.find(params[:id])
    @following = @user.following.paginate(page: params[:page])
  end

  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.paginate(page: params[:page])
  end  

  def feed
    @posts = current_user.feed
  end
end

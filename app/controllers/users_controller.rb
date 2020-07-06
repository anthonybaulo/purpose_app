class UsersController < ApplicationController
  
  def home
    @user = current_user
  end
  
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @mission_statement = @user.mission_statements.where("public = true").first
    @posts = @user.posts.where("public = true").paginate(page: params[:page])
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
    @posts = current_user.feed.paginate(page: params[:page])
  end

  def events
    # TODO make events equal to all timers AND counters
    @events = current_user.timers.paginate(page: params[:page])
  end
end

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

  def destroy
  end
end
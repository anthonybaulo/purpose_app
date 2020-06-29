class RelationshipsController < ApplicationController

  def create
    # Must use instance variable for js
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    
    # # Code works without the following
    # # Conditions for html or js requests
    # respond_to do |format|
    #   # If JS is disabled in the browser
    #   format.html { redirect_to @user }
    #   # If not, run views/relationships/create.js.erb
    #   format.js
    # end
  end

  def destroy
    # Must use instance variable for js
    # params[:id] contains the unique id assigned at the relationships table
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    
    # # Code works without the following
    # # Conditions for html or js requests
    # respond_to do |format|
    #   # If JS is disabled in the browser
    #   format.html { redirect_to @user }
    #   # If not, run views/relationships/destroy.js.erb
    #   format.js
    # end
  end
end

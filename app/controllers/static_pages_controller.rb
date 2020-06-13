class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:home]

  def home
    redirect_to @current_user if user_signed_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end

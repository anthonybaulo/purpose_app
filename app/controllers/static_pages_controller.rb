class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!

  def welcome
    redirect_to home_path if user_signed_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end

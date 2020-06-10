class ApplicationController < ActionController::Base
  before_action :authenticate_user!    # TODO: Set exceptions in appropriate controllers
end

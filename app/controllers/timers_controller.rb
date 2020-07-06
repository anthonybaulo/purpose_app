class TimersController < ApplicationController
  
  def index
    @timers = current_user.timers.paginate(page: params[:page])
  end

  def new
    @timer = Timer.new
  end

  def create
    @timer = current_user.timers.build(timer_params)
    if @timer.save
      flash[:alert] = "Timer created"
      redirect_to timers_path
    else
      flash[:error] = "Timer was not created"
      render 'new'
    end    
  end

  def edit
    @timer = Timer.find(params[:id])
    # Store referring url in session for redirect after update
    store_forwarding_url
  end
  
  def update
    @timer = Timer.find(params[:id])
    if @timer.update(timer_params)
      flash[:alert] = "Timer updated"
      forwarding_url = session[:forwarding_url]
      session[:forwarding_url] = nil
      redirect_to forwarding_url || timers_path
    else
      flash[:error] = "Timer was not updated"
      render 'edit'
    end
  end
  
  def destroy 
    @timer = Timer.find(params[:id])
    if @timer.destroy
      flash[:alert] = "Timer deleted" 
      redirect_to timers_path
    else
      flash[:error] = "Timer was not deleted"
      render 'index'
    end
  end

  private

    def timer_params
      params.require(:timer).permit(:name, :unit, :date)
    end  
end

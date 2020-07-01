class MissionStatementsController < ApplicationController

  def index
    @mission_statements = current_user.mission_statements
  end

  def new
    @mission_statement = MissionStatement.new
  end

  def create
    @mission_statement = current_user.mission_statements.build(ms_params)
    if @mission_statement.save
      flash[:alert] = "Mission Statement created"
      redirect_to mission_statements_path
    else
      flash[:error] = "Mission Statement was not created"
      render 'new'
    end
  end

  def edit
    @mission_statement = MissionStatement.find(params[:id])
  end

  def update
    @mission_statement = MissionStatement.find(params[:id])
    if @mission_statement.update(ms_params)
      flash[:alert] = "Mission Statement updated"
      redirect_to mission_statements_path
    else
      flash[:error] = "Mission Statement was not updated"
      render 'edit'      
    end
  end

  def destroy 
    @mission_statement = MissionStatement.find(params[:id])
    if @mission_statement.destroy
      flash[:alert] = "Mission Statement deleted" 
      redirect_to mission_statements_path
    else
      flash[:error] = "Mission Statement was not deleted"
      render 'index'
    end
  end

  private

    def ms_params
      params.require(:mission_statement).permit(:content, :public)
    end
end

class CallsController < ApplicationController
  def index
  end

  def show
    @call = Call.find(params[:id])
  end

  def create
    project = Team.find(params[:team_id]).project
    @call = Call.create(team_id: params[:team_id])
    redirect_to section_show_path(project.stages.first.sections.first, @call)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def calls_params
    params.require(:call).permit(:customer_name, :title, :last_section, :team, :notes)
  end
end

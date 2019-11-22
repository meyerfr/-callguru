class UsersController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(teams_params)
    if @team.save
      redirect_to user_teams_path(current_user)
    else
      render :new
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(teams_params)
      redirect_to @team
    else
      render :edit
    end
  end

  def destroy
    @team = Team.find(params[:id])
    if @team.destroy
      redirect_to user_teams_path(current_user)
    else
      redirect_to(:back)
    end
  end

  private

  def users_params
    params.require(:team).permit(:user_id, :project_id, :role)
  end
end

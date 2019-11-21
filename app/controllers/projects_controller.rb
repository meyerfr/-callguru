class ProjectsController < ApplicationController
  # skip_before_action :authenticate_user!
  before_action :check_sign_in!
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params(:id))
  end

  def new
    @project = Project.new(user_id: current_user.id)
    @projects = Project.all
    @user = current_user
    #@project.stages.build.sections.build.scripts.build
  end

  def create
    @project = Project.new(projects_params)
    @project.user_id = params[:user_id]
    if @project.save!
      redirect_to new_project_stage_path(@project)
    else
      render :new
    end
  end

  def edit
    @user = current_user
    @project = Project.find(params[:id])
    @projects = Project.all
    # @project.stages.build
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(projects_params)
      redirect_to @project
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      redirect_to user_projects_path(current_user)
    else
      redirect_to(:back)
    end
  end

  private

  def projects_params
    # params.require(:project).permit(:name, :goal, :user_id, stages_attributes: [:id, :_destroy, :project_id, :name])
    params.require(:project).permit(:name, :goal, :user_id, stages_attributes: Stage.attribute_names.map(&:to_sym).push(:_destroy))
  end
end

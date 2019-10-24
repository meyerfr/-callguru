class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params(:id))
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(projects_params)
    if @project.save
      redirect_to projects
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
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
      redirect_to projects
    else
      redirect_to(:back)
    end
  end

  private

  def projects_params
    params.require(:projects).permit(:first_name, :last_name, :email)
  end
end

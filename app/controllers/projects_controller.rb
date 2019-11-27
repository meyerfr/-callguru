class ProjectsController < ApplicationController
  # skip_before_action :authenticate_user!
  before_action :check_sign_in!
  before_action :check_teamleader!, only: [:edit, :update, :destroy]

  def index
    @projects = current_user.projects
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    @projects = current_user.projects
    @user = current_user
    #@project.stages.build.sections.build.scripts.build
  end

  def create
    @project = Project.new(projects_params)
    if @project.save!
      Team.create(user_id: current_user.id, project_id: @project.id, role: 'teamleader')
      redirect_to user_projects_path(current_user)
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
    params.require(:project).permit(:name, :goal, :user_id,
      stages_attributes: [:id, :name, :project_id, :created_at, :updated_at, :_destroy,
        sections_attributes: [:id, :name, :stage_id, :created_at, :updated_at, :_destroy,
          scripts_attributes: [:id, :name, :text, :section_id, :created_at, :updated_at, :_destroy]
        ]
      ]
    )

    # params.require(:project).permit(:name, :goal, :user_id, stages_attributes: Stage.attribute_names.map(&:to_sym).push(:_destroy))
  end

  def check_teamleader!
    redirect_to user_projects_path(current_user), alert: "Please contact the admin of the project for editing" unless
      current_user_teamleader?
  end

  def current_user_teamleader?
    return_boolean = false
    Project.find(params[:id]).teams.all.where(role: 'teamleader').each do |team|
      return_boolean = true if team.user_id == current_user.id
    end
    return_boolean
  end
end

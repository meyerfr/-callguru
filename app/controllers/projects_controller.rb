class ProjectsController < ApplicationController
  def index
    @projects = User.all
  end

  def show
    @user = User.find(params(:id))
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(projects_params)
    if @user.save
      redirect_to projects
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(projects_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
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

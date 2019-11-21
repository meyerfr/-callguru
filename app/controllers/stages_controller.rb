class StagesController < ApplicationController
  def index
    @stages = Stage.all
  end

  def show
    @stage = Stage.find(params[:id])
  end

  def new
    @project = Project.find(params[:project_id])
    @stage = Stage.new
    @section = Section.new
    @script = Script.new
  end

  def create
    @stage = Stage.new(stages_params)
    if @stage.save
      redirect_to project_stages(@project)
    else
      render :new
    end
  end

  def edit
    @stage = Stage.find(params[:id])
  end

  def update
    @stage = Stage.find(params[:id])
    if @stage.update(stages_params)
      redirect_to @stage
    else
      render :edit
    end
  end

  def destroy
    @stage = Stage.find(params[:id])
    if @stage.destroy
      redirect_to project_stages(@project)
    else
      redirect_to(:back)
    end
  end

  private

  def stages_params
    params.require(:stage).permit(:name, sections_attributes: Section.attribute_names.map(&:to_sym).push(:_destroy))
  end

  def find_project
    @project = Project.find(params[:project_id])
  end
end

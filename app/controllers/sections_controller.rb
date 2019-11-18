class SectionsController < ApplicationController
  def index
    @sections = Section.all
  end

  def show
    @section = Section.find(params(:id))
  end

  def new
    @section = Section.new
    @section.scripts.build
  end

  def create
    @section = Section.new(sections_params)
    if @section.save
      redirect_to stage_sections(@stage)
    else
      render :new
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update(sections_params)
      redirect_to @section
    else
      render :edit
    end
  end

  def destroy
    @section = Section.find(params[:id])
    if @section.destroy
      redirect_to stage_sections(@stage)
    else
      redirect_to(:back)
    end
  end

  private

  def sections_params
    params.require(:section).permit(:name, scripts_attributes: Script.attribute_names.map(&:to_sym).push(:_destroy))
  end

  def find_stage
    @stage = Stage.find(params[:stage_id])
  end
end

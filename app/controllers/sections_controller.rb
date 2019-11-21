class SectionsController < ApplicationController
  def index
    @sections = Section.all
  end

  def show
    @section = Section.find(params[:id])
    @stage = @section.stage
    @project = @stage.project
    # @project = Project.find(@stage.project_id)
    @next_section = @section.next
    @next_section = @stage.next.sections.first if @next_section.nil? && !@stage.next.nil?
    @prev_section = @section.prev
    @prev_section = @stage.prev.sections.last if @prev_section.nil? && !@stage.prev.nil?
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

  def find_next_section(project, stage, section_now)
  #   stage.sections.each_with_index do |section, index|
  #     if section == section_now
  #       return stage.sections[index + 1]
  #     end
  #   end
  #   # if next section.nil? dann muss nach der nächsten Stage und der ersten Section der nächsten Stage geguckt werden.
  #   stage.sections.each_with_index { |section, index| return stage.sections[index + 1] if section == section_now }
  end
end

class StagesController < ApplicationController
  def index
    @stages = Stage.all
  end

  def show
    @stage = Stage.find(params(:id))
  end

  def new
    @stage = Stage.new
  end

  def create
    @stage = Stage.new(stages_params)
    if @stage.save
      redirect_to stages
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
      redirect_to stages
    else
      redirect_to(:back)
    end
  end

  private

  def stages_params
    params.require(:stages).permit(:first_name, :last_name, :email)
  end
end

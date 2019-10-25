class ScriptsController < ApplicationController
  def index
    @scripts = Script.all
  end

  def show
    @script = Script.find(params(:id))
  end

  def new
    @script = Script.new
  end

  def create
    @script = Script.new(scripts_params)
    if @script.save
      redirect_to scripts
    else
      render :new
    end
  end

  def edit
    @script = Script.find(params[:id])
  end

  def update
    @script = Script.find(params[:id])
    if @script.update(scripts_params)
      redirect_to @script
    else
      render :edit
    end
  end

  def destroy
    @script = Script.find(params[:id])
    if @script.destroy
      redirect_to scripts
    else
      redirect_to(:back)
    end
  end

  private

  def scripts_params
    params.require(:script).permit(:name, :text)
  end
end

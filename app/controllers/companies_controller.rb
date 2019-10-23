class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(companies_params)
    if @company.save
      redirect_to companies
    else
      render :new
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(companies_params)
      redirect_to @company
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:id])
    if @company.destroy
      redirect_to companies
    else
      redirect_to(:back)
    end
  end

  private

  def companies_params
    params.require(:company).permit(:name, :city)
  end
end

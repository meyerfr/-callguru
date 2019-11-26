class UsersController < ApplicationController
  include UsersHelper

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to company_users(@company)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(users_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to company_users_path(current_user.company)
    else
      redirect_to(:back)
    end
  end

  private

  def users_params
    params.require(:user).permit(:first_name, :last_name, :email, :role, :signed_in_as)
  end

  def find_company
    @company = Company.find(params[:company_id])
  end
end

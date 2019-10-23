class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params(:id))
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to users
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
      redirect_to users
    else
      redirect_to(:back)
    end
  end

  private

  def users_params
    params.require(:users).permit(:first_name, :last_name, :email)
  end
end

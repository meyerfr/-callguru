class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  private

  def authenticate_admin!
    redirect_to :back, alert: "You don´t have permission for this page" unless
      current_user.role == 'admin'
  end

  def authenticate_superadmin!
    redirect_to :back, alert: "You don´t have permission for this page" unless
      current_user.role == 'superadmin'
  end

  def authenticate_user!
    redirect_to :back, alert: "You don´t have permission for this page" unless
      current_user.role == 'user'
  end
end

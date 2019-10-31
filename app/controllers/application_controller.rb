class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :check_sign_in!
  # before_action :authenticate_user!

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
    redirect_to root_path, alert: "You don´t have permission for this page" unless
      current_user.role == 'user'
  end

  def check_sign_in!
    redirect_to new_user_session_path, alert: "You have to LogIn first" unless
      user_signed_in?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:first_name, :last_name, :email, :role, :signed_in_as)
    end
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || welcome_path
  end

  def after_sign_in_path_for(resource)
    user_projects_path(current_user)
  end

  def after_sign_out_path_for(resource)
    pages_log_in_as_path
  end
end

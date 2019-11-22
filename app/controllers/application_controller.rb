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

  # def authenticate_user!
  #   redirect_to root_path, alert: "You don´t have permission for this page" unless
  #     current_user.role == 'user'
  # end

  def check_sign_in!
    redirect_to new_user_session_path, alert: "You have to LogIn first" unless
      user_signed_in?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:first_name, :last_name, :email, :role, :signed_in_as)
    end
  end

  # def after_sign_in_path_for(resource)
  #   stored_location_for(resource) || welcome_path
  # end

  def after_sign_in_path_for(resource)
    user_projects_path(current_user)
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def after_invite_path_for(resource)
    company_users_path(current_user.company)
  end

  def handle_unverified_request
    # Store the current url so at after_sign_in_path_for it grabs this URL and not the new_user_session_path
    # store_location_for(:user, request.fullpath) # This is if you're using devise. It just store the last URL the user visited
    redirect_to new_user_session_path, alert: 'You have already signed out or the session has expired. Please sign in again.' # Redirect to the sign in path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:email, :signed_in_as)
    end
  end
end

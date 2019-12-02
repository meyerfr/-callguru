class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]
  # skip_before_action :check_sign_in!
  layout 'landingpage', only: [:home]
  def home
  end

  def setting
  end

  def change_sign_in_as
    user = User.find(params[:user_id])
    if user.signed_in_as == 'user'
      user.update!(signed_in_as: 'admin')
    elsif user.signed_in_as == 'admin'
      user.update!(signed_in_as: 'user')
    end
    redirect_to user_projects_path(current_user)
  end

  def blueprint
    @project = Project.find(params[:project_id])
    @call = Call.find(params[:call_id])
  end
end

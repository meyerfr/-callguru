class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def log_in_as
  end

  def setting
  end

  def change_sign_in_as
    user = User.find(params[:user_id])
    if user.signed_in_as == 'user'
      user.update(signed_in_as: 'admin')
    elsif user.signed_in_as == 'admin'
      user.update(signed_in_as: 'user')
    end
  end

  def blueprint
    @projects = Project.all
  end
end

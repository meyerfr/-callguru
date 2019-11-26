module UsersHelper
  def full_name(user)
    "#{user.first_name} #{user.last_name}"
  end

  def user_status(user)
    if user.created_by_invite?
      if user.invitation_accepted?
        '<i class="fas fa-check"></i>'.html_safe
      else
        '<i class="fas fa-check"></i>'.html_safe
      end
    else
      "#{full_name(user)} was not created by invite"
    end
  end
end

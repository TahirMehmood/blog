module ApplicationHelper
  def is_admin?
    return current_user.try(:admin?)
  end
end

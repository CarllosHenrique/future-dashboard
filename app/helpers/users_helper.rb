# Helper for users
module UsersHelper
  def user_role(user)
    if user.has_role?(:admin)
      t('user.permission.role.admin')
    elsif user.has_role?(:partner)
      t('user.permission.role.partner')
    end
  end
end

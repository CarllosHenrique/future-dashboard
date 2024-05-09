# Helper for users
module UsersHelper
  def user_role(user)
    if user.admin?
      t('user.permission.role.admin')
    elsif user.partner?
      t('user.permission.role.partner')
    end
  end
end

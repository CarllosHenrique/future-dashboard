# Author: Ramashish Gaur
class HomePolicy < ApplicationPolicy
  include PolicyRules::Admin
  include PolicyRules::Partner

  # Scope class for UserPolicy
  class Scope < Scope
    include PolicyRules::Admin

    PolicyRules::Admin.instance_methods.each { |m| undef_method(m) if m != 'admin?' }

    def resolve
      scope.with_policy(user)
    end
  end

  def index?
    partner? || admin?
  end

  private

  def partner?
    is_partner?
  end
end

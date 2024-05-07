# Author: Ramashish Gaur
class UserPolicy < ApplicationPolicy
  include PolicyRules::Admin
  include PolicyRules::Partner

  # Scope class for UserPolicy
  class Scope < Scope
    include PolicyRules::Admin
    include PolicyRules::Partner

    PolicyRules::Admin.instance_methods.each { |m| undef_method(m) if m != 'admin?' }

    def resolve
      scope.with_policy(user)
    end
  end

  def index?
    admin?
  end

  def show?
    admin?
  end

  def update?
    partner? || admin?
  end

  def edit?
    partner? || admin?
  end

  def create?
    admin?
  end

  def destroy?
    admin?
  end

  def new?
    admin?
  end

  private

  def partner?
    is_partner?
  end
end

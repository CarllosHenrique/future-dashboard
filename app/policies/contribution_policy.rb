# Author: Ramashish Gaur
class ContributionPolicy < ApplicationPolicy
  include PolicyRules::Admin

  # Scope class for UserPolicy
  class Scope < Scope
    include PolicyRules::Admin

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
    admin?
  end

  def edit?
    admin?
  end

  def create?
    admin?
  end

  def destroy?
    admin?
  end
end

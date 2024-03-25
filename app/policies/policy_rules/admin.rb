module PolicyRules
  # Description: Módulo que define as regras de autorização para o papel de admin.
  module Admin
    def index?
      admin?
    end

    def create?
      admin?
    end

    def destroy?
      admin?
    end

    def show?
      admin?
    end

    def update?
      admin?
    end

    private

    def admin?
      is_admin?
    end

    def is_admin? # rubocop:disable Naming/PredicateName
      @user.has_role?(:admin)
    end
  end
end

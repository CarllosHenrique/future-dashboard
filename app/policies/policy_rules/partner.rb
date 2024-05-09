module PolicyRules
  # Description: Módulo que define as regras de autorização para o papel de admin.
  module Partner
    def index?
      partner?
    end

    def create?
      partner?
    end

    def destroy?
      partner?
    end

    def show?
      partner?
    end

    def update?
      partner?
    end

    private

    def partner?
      is_admin?
    end

    def is_partner? # rubocop:disable Naming/PredicateName
      @user.partner?
    end
  end
end

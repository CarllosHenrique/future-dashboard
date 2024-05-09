# Helper for the Home controller
module HomeHelper
  def approved_applied_value
    number_to_currency(Contribution.where(status: true, user: current_user).sum(:value))
  end

  def pending_applied_value
    number_to_currency(Contribution.where(status: false, user: current_user).sum(:value))
  end

  def chars_applied_value
    Contribution.where(status: true, user: current_user).pluck(:updated_at, :value)
  end
end

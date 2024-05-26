# Helper for the Home controller
module HomeHelper
  def approved_applied_value
    number_to_currency(Contribution.where(status: true, user: current_user).sum(:value))
  end

  def pending_applied_value
    number_to_currency(Contribution.where(status: false, user: current_user).sum(:value))
  end

  def chars_applied_value
    contributions = Contribution.where(status: true, user: current_user).pluck(:updated_at, :value)

    contributions.map do |updated_at, value|
      [updated_at.strftime("%d/%m/%Y ás %H:%M:%S"), value]
    end
  end

  def donut_chart_data
    results = Contribution.joins(:user).where(status: true).pluck('users.id', 'users.name', 'contributions.value')

    total_contributions = 0
    current_user_contribution = 0

    results.each do |user_id, _name, value|
      total_contributions += value
      current_user_contribution += value if user_id == current_user.id
    end

    remaining_contributions = total_contributions - current_user_contribution

    [
      ['Você', current_user_contribution],
      ['Fundo', remaining_contributions]
    ]
  end
end

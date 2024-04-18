# == Schema Information
#
# Table name: contributions
#
#  id           :bigint           not null, primary key
#  value        :decimal(, )      default(0.0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  portfolio_id :bigint           not null
#
# Indexes
#
#  index_contributions_on_portfolio_id  (portfolio_id)
#
# Foreign Keys
#
#  fk_rails_...  (portfolio_id => portfolios.id)
#
class Contribution < ApplicationRecord
  acts_as_hashids

  belongs_to :portfolio

  validates :value, presence: true, numericality: { greater_than: 0 }

  before_create :update_portfolio_applied_value

  private

  def update_portfolio_applied_value
    Portfolio.first.update(applied_value: Contribution.sum(:value))

    value = (Portfolio.first.applied_value * 0.0889)
    Portfolio.first.update(gross_balance: Portfolio.first.applied_value + value)
  end
end

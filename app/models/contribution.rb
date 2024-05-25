# == Schema Information
#
# Table name: contributions
#
#  id           :bigint           not null, primary key
#  status       :boolean          default(FALSE)
#  value        :decimal(, )      default(0.0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  portfolio_id :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_contributions_on_portfolio_id  (portfolio_id)
#  index_contributions_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (portfolio_id => portfolios.id)
#  fk_rails_...  (user_id => users.id)
#
class Contribution < ApplicationRecord
  acts_as_hashids

  belongs_to :portfolio
  belongs_to :user

  validates :value, presence: true, numericality: { greater_than: 0 }
  validates :value, numericality: { less_than_or_equal_to: 1_000_000_000 }

  private

  def update_portfolio_applied_value
    if Contribution.count >= 1
      Portfolio.update(applied_value: Contribution.sum(:value))
    else
      Portfolio.update(applied_value: value)
    end
  end
end

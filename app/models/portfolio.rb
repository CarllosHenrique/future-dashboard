# == Schema Information
#
# Table name: portfolios
#
#  id            :bigint           not null, primary key
#  applied_value :decimal(, )      default(0.0)
#  gross_balance :decimal(, )      default(0.0)
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Portfolio < ApplicationRecord
  validates :name, presence: true
  validates :applied_value, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :gross_balance, presence: true, numericality: { greater_than_or_equal_to: 0 }

  has_many :contributions, dependent: :destroy
  has_many :users, dependent: :destroy

  after_save :recalculate_user_participation, if: :saved_change_to_applied_value?

  private

  def recalculate_user_participation
    users.find_each(&:update_participation!)
  end
end

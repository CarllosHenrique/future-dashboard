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
end

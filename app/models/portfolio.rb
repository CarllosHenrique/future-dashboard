# == Schema Information
#
# Table name: portfolios
#
#  id              :bigint           not null, primary key
#  applied_value   :decimal(, )      default(0.0)
#  gross_balance   :decimal(, )      default(0.0)
#  name            :string
#  total_dividends :decimal(, )      default(0.0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Portfolio < ApplicationRecord
end

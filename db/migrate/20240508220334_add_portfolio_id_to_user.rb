# migration to add portfolio_id to user
class AddPortfolioIdToUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :portfolio, foreign_key: true
  end
end

# Version: 0.0.1
class CreatePortfolios < ActiveRecord::Migration[7.1]
  def change
    create_table :portfolios do |t|
      t.string :name
      t.decimal :applied_value, default: 0.0
      t.decimal :gross_balance, default: 0.0

      t.timestamps
    end
  end
end

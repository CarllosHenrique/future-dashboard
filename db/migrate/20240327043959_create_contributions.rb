# Version: 0.1
class CreateContributions < ActiveRecord::Migration[7.1]
  def change
    create_table :contributions do |t|
      t.references :portfolio, null: false, foreign_key: true
      t.decimal :value, default: 0.0

      t.timestamps
    end
  end
end

class AddStatusToContribution < ActiveRecord::Migration[7.1]
  def change
    add_column :contributions, :status, :boolean, default: false
  end
end

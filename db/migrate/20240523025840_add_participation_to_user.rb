# migration to add participation to user
class AddParticipationToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :participation, :float, default: 0.0
  end
end

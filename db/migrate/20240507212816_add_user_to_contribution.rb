# migration to add user to contribution
class AddUserToContribution < ActiveRecord::Migration[7.1]
  def change
    add_reference :contributions, :user, null: false, foreign_key: true
  end
end

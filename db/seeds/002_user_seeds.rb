# Seeds for User model
class UserSeeds < Seeds::Base
  def call
    user = User.new name: ENV.fetch("DEFAULT_ADMIN_NAME"),
                    phone: ENV.fetch("DEFAULT_ADMIN_PHONE"),
                    birthdate: "2024-03-21",
                    email: ENV.fetch("DEFAULT_ADMIN_EMAIL"),
                    password: ENV.fetch("DEFAULT_ADMIN_PASSWORD"),
                    portfolio_id: Portfolio.first.id
    user.save!
    user.add_role(:admin)

    puts "#{self.class} - Created user: #{user.name} - #{user.email}"
  end
end

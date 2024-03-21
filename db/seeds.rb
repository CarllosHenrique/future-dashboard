user = User.new(name: "Admin", username: "admin", phone: "1234567890", birthdate: "2024-03-21", email: "crick.lucas@gmail.com", password: "123456", password_confirmation: "123456")
user.save!
puts "Admin user created"

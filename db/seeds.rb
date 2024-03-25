user = User.new(name: "Carlos Henrique", phone: "1234567890", birthdate: "2024-03-21", email: "crick.lucas@gmail.com", password: "123456")
user.save!
user.role_add(:admin)
puts "Admin user created"

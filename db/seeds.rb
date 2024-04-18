user = User.new(name: "Carlos Henrique", phone: "1234567890", birthdate: "2024-03-21", email: "crick.lucas@gmail.com", password: "123456")
user.save!
user.role_add(:admin)
puts "Admin user created"

Portfolio.create! name: "Fundo Futuro"
capital_inicial = Contribution.create! value: 1460.0, portfolio: Portfolio.first
capital_inicial.save!
puts "Portfolio created with initial contribution"

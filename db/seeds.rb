require "faker"
User.create!(name:  "Admin",
             email: "admin@example.com",
             password:              "pass",
             password_confirmation: "pass",
             role: 0,
             phone_number: "+84123456789",
             create_date: Time.zone.now,
             address: "12/3 Dien Bien Phu")

99.times do |n|
  Book.create({name: Faker::Book.title,
  author: Faker::Book.author,
  price: n + 100,
  publisher: Faker::Book.publisher,
  category: Faker::Book.genre,
  total_amount: n + 100,
  ready_amount: n})
end

99.times do
  Author.create({name: Faker::Book.author})
end

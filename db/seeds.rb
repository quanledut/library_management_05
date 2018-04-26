User.create!(name:  "Admin",
             email: "admin@example.com",
             password:              "pass",
             password_confirmation: "pass",
             role: 0,
             phone_number: "+84123456789",
             create_date: Time.zone.now,
             address: "12/3 Dien Bien Phu")

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@email.org"
  password = "pass"
  phone_number = Faker::PhoneNumber.phone_number
  role = 1
  create_date = Faker::Date.forward(23)
  address = Faker::Address.street_address
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               role: role,
               phone_number: phone_number,
               create_date: create_date,
               address: address)
end

99.times do |n|
  author = Author.create!(name: Faker::Book.author,
                 detail: "nothing")
  category = Category.create!(parent_ID: n + 1,
                   name: Faker::Book.genre)
  name = Faker::Book.title
  publisher = Faker::Book.publisher
  price = 100
  detail = "nothing"
  total_amount = 100
  ready_amount = 1
  Book.create!(name: name,
               author_id: author.id,
               price: price,
               publisher: publisher,
               detail: detail,
               category_id: category.id,
               total_amount: total_amount,
               ready_amount: ready_amount)
end

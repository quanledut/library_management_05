User.create!(name:  "Admin",
             email: "admin@example.com",
             password:              "password",
             password_confirmation: "password",
             role: 0,
             phone_number: "+84123456789",
             create_date: Time.zone.now,
             address: "12/3 Dien Bien Phu")

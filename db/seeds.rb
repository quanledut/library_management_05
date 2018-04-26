
User.create!(name:  "Admin",
             email: "admin@example.com",
             password:              "pass",
             password_confirmation: "pass",
             role: 0,
             phone_number: "+84123456789",
             create_date: Time.zone.now,
             address: "12/3 Dien Bien Phu")

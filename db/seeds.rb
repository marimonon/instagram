User.create!(email: "example@example.com",
            name:  "Example user",
            password:              "hogehoge",
            password_confirmation: "hogehoge")

User.create!(email: "example2@example.com",
            name:  "Example2 user",
            password:              "hogehoge",
            password_confirmation: "hogehoge")

User.create!(email: "example3@example.com",
            name:  "Example3 user",
            password:              "hogehoge",
            password_confirmation: "hogehoge")

User.create!(email: "example4@example.com",
            name:  "Example4 user",
            password:              "hogehoge",
            password_confirmation: "hogehoge")
# 5.times do |n|
#   name = Faker::Pokemon.name
#   email = Faker::Internet.email
#   password = "hogehoge"
#   User.create!(name: name,
#               email: email,
#               password: password,
#               password_confirmation: password,
#               )
# end
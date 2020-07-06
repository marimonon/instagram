User.create!(email: "example@example.com",
            name:  "Example user",
            password:              "hogehoge",
            password_confirmation: "hogehoge")


User.all.each do |user|
# 2.upto(5) do |n|
# user.create!(email: "example#{n}@example.com",
#             name:  "Example#{n} user",
#             password:              "hogehoge",
#             password_confirmation: "hogehoge")

@post=user.posts.build(
               contain: open("#{Rails.root}/db/fixtures/1.jpg")
              )
@post.save

  # end
end

# User.create!(
#               [
#                 {email: "example2@example.com",
#                   name:  "Example2 user",
#                   password:              "hogehoge",
#                   password_confirmation: "hogehoge"},
#                 {email: "example3@example.com",
#                   name:  "Example3 user",
#                   password:              "hogehoge",
#                   password_confirmation: "hogehoge"},
#                 {email: "example4@example.com",
#                   name:  "Example4 user",
#                   password:              "hogehoge",
#                   password_confirmation: "hogehoge"},                  
#             ]
#             )

# User.all.each do |user|
#   users.create!(
#                       contain: open("#{Rails.root}/db/fixtures/#{n}.jpg")
#                       )
# end
             
# 1.upto(5) do |n|
#   Post.create!(
#               contain: File.open("#{Rails.root}/db/fixtures/#{n}.jpg")
#               )
# end

            
# User.all.each do |post|
#   post.posts.create!(
#                       contain: open("#{Rails.root}/db/fixtures/#{n}.jpg")
#                       )
# end

# User.all.each do |user|
#   user.posts.create!(
#                       contain: open("#{Rails.root}/db/fixtures/img#{n}.jpg")
#                       )
# end

# User.create!(email: "example2@example.com",
#             name:  "Example2 user",
#             password:              "hogehoge",
#             password_confirmation: "hogehoge")

# User.create!(email: "example3@example.com",
#             name:  "Example3 user",
#             password:              "hogehoge",
#             password_confirmation: "hogehoge")

# User.create!(email: "example4@example.com",
#             name:  "Example4 user",
#             password:              "hogehoge",
#             password_confirmation: "hogehoge")
            
  # 5.times do |index|
  # Post.create(
  #             contain: open("#{Rails.root}/db/fixtures/img#{n}.jpg")
  #             )
  # end

# User.create!(name: 'taro yamada', image: open("#{Rails.root}/db/fixtures/img1.jpg"))

# 1.upto(5) do |n|
#   Post.create!(
#               contain: open("#{Rails.root}/db/fixtures/img#{n}.jpg")
#               )
# end

# 6.times do |index|
#   Work.create(name: "Work#{index}",
#   contents: "My work#{index}",
#   image: File.open("./app/assets/images/home.jpg"))
# end

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


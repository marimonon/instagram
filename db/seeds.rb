User.create!(email: "example@example.com",
            name:  "Example user",
            password:              "hogehoge",
            password_confirmation: "hogehoge")

User.create!(
              [
                {email: "example2@example.com",
                  name:  "Example2 user",
                  password:              "hogehoge",
                  password_confirmation: "hogehoge"},
                {email: "example3@example.com",
                  name:  "Example3 user",
                  password:              "hogehoge",
                  password_confirmation: "hogehoge"},
                {email: "example4@example.com",
                  name:  "Example4 user",
                  password:              "hogehoge",
                  password_confirmation: "hogehoge"},                  
              ]
            )

User.all.each do |user|
  1.upto(9) do |n|
  @post=user.posts.build(
                 contain: open("#{Rails.root}/db/fixtures/#{n}.jpg")
                )
  @post.save
  end
end


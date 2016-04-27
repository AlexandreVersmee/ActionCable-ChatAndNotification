# Users & Channels
20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated:    true,
               activated_at: Time.zone.now)
end

# Custom Users
custom_users = ["alexandre", "maxence", "vivien"]
3.times do |n|
  name  = custom_users[n]
  email = "#{custom_users[n]}@uqar.ca"
  password = "#{custom_users[n]}"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated:    true,
               activated_at: Time.zone.now)

  user_id = "#{n+21}"

  Notification.create!(content: "L'utilisateur Sasha Predovic DDS (id: #1) vous suit.",
                       status: 0,
                       user_id_to_notified: user_id,
                       notified_by: 1,
                       created_at: Time.zone.now,
                       updated_at: Time.zone.now)

end

# Microposts
users = User.order(:created_at).take(6)
15.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..23]
followers = users[3..23]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

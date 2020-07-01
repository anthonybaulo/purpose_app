# Create a main sample user.
# The ! will raise an exception if it doesn't work (noisy method)
user = User.new(email:                 "main@example.com",
                password:              ENV['DEV_PW'],
                password_confirmation: ENV['DEV_PW'])
user.skip_confirmation!
user.save!

# Generate additional users.
49.times do |n|
  name     = Faker::Name.first_name
  email    = "#{name}-#{n}@example.com"
  password = "password"
  User.create!(email:                 email,
               password:              password,
               password_confirmation: password)
end

# Create Mission Statement for all users.
users = User.all

users.each do |user| 
  content = Faker::Lorem.paragraphs(number: 5, supplemental: true).join("\n\n")
  user.mission_statements.create!(content: content)
end

# Create Posts for users.
3.times do
  users.each do |user| 
    title   = Faker::Company.bs
    content = Faker::Lorem.paragraphs(number: 5, supplemental: true).join("\n\n")
    user.posts.create!(title: title, content: content, public: true)
  end
end

# Create following relationships.
user      = users.first
following = users[2..40]
followers = users[10..30]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

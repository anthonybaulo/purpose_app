# Create a main sample user.
# The ! will raise an exception if it doesn't work (noisy method)
User.create!(email:                 "main@example.com",
             password:              "anthony",
             password_confirmation: "anthony")

# Generate a bunch of additional users.
49.times do |n|
  name     = Faker::Name.first_name
  email    = "#{name}-#{n}@example.com"
  password = "password"
  User.create!(email:                 email,
               password:              password,
               password_confirmation: password)
end

# Create 3 MS's for second user.
user2 = User.second
3.times do
  content = Faker::Lorem.sentence(word_count: 40)
  user2.mission_statements.create!(content: content)
end

# Create single Mission Statement for all but first 2 users.
users = User.all

users[2..-1].each do |user| 
  content = Faker::Lorem.sentence(word_count: 40)
  user.mission_statements.create!(content: content)
end

# Create Posts for users.
3.times do
  users.each do |user| 
    title = Faker::Company.bs
    content = Faker::Lorem.sentence(word_count: 30)
    user.posts.create!(title: title, content: content)
  end
end

# Create following relationships.
user  = users.first
following = users[2..40]
followers = users[10..30]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

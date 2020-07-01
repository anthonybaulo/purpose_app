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
2.times do |n|
  users.each do |user| 
    content = Faker::Lorem.paragraphs(number: 5, supplemental: true).join("\n\n")
    pub     = n.odd? ? true : false
    user.mission_statements.create!(content: content, public: pub)
  end
end

# Create Posts for users.
5.times do |n|
  users.each do |user| 
    title   = Faker::Company.bs
    content = Faker::Lorem.paragraphs(number: 5, supplemental: true).join("\n\n")
    pub     = n.odd? ? true : false    
    user.posts.create!(title: title, content: content, public: pub)
  end
end

# Create following relationships.
users.each do |user|
  following = users.sample(rand(1..25))
  following.each { |followed| user.follow(followed) }
end
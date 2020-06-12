# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create a main sample user
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

# Create 3 MS's for second user
user2 = User.second
3.times do
  content = Faker::Lorem.sentence(word_count: 40)
  user2.mission_statements.create!(content: content)
end

# Create single Mission Statement for all but first 2 users
users = User.all

users[2..-1].each do |user| 
  content = Faker::Lorem.sentence(word_count: 40)
  user.mission_statements.create!(content: content)
end
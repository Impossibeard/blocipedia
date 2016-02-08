# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
5.times do
  User.create(
  username: Faker::Name.last_name,
  email: Faker::Internet.safe_email,
  password: "password",
  password_confirmation: "password"
  )
end
users = User.all

15.times do
  Wiki.create(
  title: Faker::Hipster.sentence(3),
  body: Faker::Hipster.paragraph,
  private: false,
  user: users.sample
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"

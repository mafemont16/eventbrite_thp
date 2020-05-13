# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Event.destroy_all
Participation.destroy_all

10.times do
    User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        description: Faker::TvShows::Community.quotes,
        email: "#{Faker::Name.first_name}@yopmail.com",
        password: 'holamundo'
    )
end
puts "10 users have been created"


10.times do
    Event.create!(
        start_date: Faker::Date.forward(days: 45),
        duration: 5 * rand(1..100),
        title: Faker::Book.title,
        description: Faker::Marketing.buzzwords,
        price: rand(1..999),
        location: Faker::Nation.capital_city,
        author: User.all.sample
    )
end
puts "10 events have been created"

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

2.times do
    User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        description: Faker::TvShows::Community.quotes,
        email: "#{Faker::Name.first_name}@yopmail.com",
        password: 'holamundo'
    )
end
puts "2 users have been created"


2.times do
    Event.create!(
        start_date: Faker::Date.forward(days: 45),
        duration: 5 * rand(1..100),
        title: Faker::Book.title,
        description: Faker::Lorem.paragraph(sentence_count: 10),
        price: rand(1..999),
        location: Faker::Nation.capital_city,
        admin: User.all.sample
    )
end
puts "2 events have been created"


1.times do
  @participation = Participation.create(
    stripe_customer_id: "hola",
    guest: User.all.sample,
    event: Event.all.sample
  )
end

puts "Participations are now created"

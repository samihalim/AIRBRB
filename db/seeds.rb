# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"

Booking.destroy_all
Desk.destroy_all
User.destroy_all
User.create(first_name: 'John', last_name: 'smith', email: 'a@a.com', password: '654321')
User.create(first_name: 'Sam', last_name: 'Bam', email: 'bb@a.com', password: '65432134')


10.times do
desk = Desk.new
desk.title = Faker::Company.catch_phrase
desk.user = User.all.sample
desk.price = Faker::Commerce.price
desk.location = Faker::Address.city
desk.seats = Faker::Vehicle.doors
desk.start_date = DateTime.new(2020, 11, 23)
desk.end_date = DateTime.new(2020, 11, 25)
file = URI.open('https://source.unsplash.com/weekly?desk')
desk.photo.attach(io: file, filename: "#{desk.title}.png", content_type: 'image/png')
desk.save!
1.times do
  booking = Booking.new
  booking.user = User.last
  booking.desk = desk
  booking.start_date = DateTime.new(2020, 11, 11)
  booking.end_date = DateTime.new(2020, 11, 13)
  booking.save!
end
end



puts "#{Desk.count} Desks created"
puts "#{User.count} Users created"
puts "#{Booking.count} Bookings created"




# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'pry-byebug'

Desk.destroy_all
User.destroy_all
User.create(first_name: 'John', last_name: 'smith', email: 'a@a.com', password: '654321')
User.create(first_name: 'Sam', last_name: 'Bam', email: 'bb@a.com', password: '65432134')

10.times do
  Desk.create(
    title: Faker::Company.catch_phrase,
    user: User.all.sample,
    price: Faker::Commerce.price,
    location:Faker::Address.city,
    seats: Faker::Vehicle.doors,
    start_date: DateTime.new(2020, 11, 23),
    end_date: DateTime.new(2020, 11, 25),
   )
end



puts "#{Desk.count} Desks created"
puts "#{User.count} Users created"

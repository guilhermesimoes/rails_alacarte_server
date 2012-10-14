# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create({email: 'bob@mail.com', password: 'bob1234', password_confirmation: 'bob1234', name: 'bob', telephone: '12345' })

Restaurant.create({name: 'Polo II', address: 'asd', coordinates: 'asd' })

puts 'Seeded'
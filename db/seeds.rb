# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create({email: 'bob@mail.com', password: 'bob1234', password_confirmation: 'bob1234', name: 'bob', telephone: '12345' })

Restaurant.create({name: 'Cantina do Pólo II', address: 'R. Miguel Bombarda, 105, Coimbra, 3030, Portugal', coordinates: "40°11\'10.68\"N 8°24\'51.16\"W" })

p = Restaurant.create({name: 'Bar de Informática', address: 'R. Miguel Bombarda, 105, Coimbra, 3030, Portugal', coordinates: "40°11\'12.15\"N 8°24\'58.08\"W" })

m = p.menus.create({date: Time.now})

m.meals.create({name: 'Sandes de salsicha', price: 4.20, max_reservations: 5})

m.meals.create({name: 'Sandes de frango', price: 4.20, max_reservations: 100})

puts 'Seeded'
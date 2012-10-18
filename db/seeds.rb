# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.create([ {name: 'Restaurante Luzio Vaz', coordinates: '40.2202,-8.417983'},
                    {name: 'Restaurante Central', coordinates: '40.208572,-8.421364'},
                    {name: 'Restaurante Monumentais', coordinates: '40.208564,-8.421353'},
                    {name: 'Sala B', coordinates: '40.208564,-8.421353'},
                    {name: 'Restaurante Amarelas', coordinates: '40.208514,-8.420961'},
                    {name: 'Vegetariana', coordinates: '40.356831,-8.702553'},
                    {name: 'Sandwich-Bar', coordinates: '40.208467,-8.421025'},
                    {name: 'Centro Cultural Casa da Pedra', coordinates: '40.18595,-8.417253'},
                    {name: 'Restaurante das Químicas', coordinates: '40.207417,-8.424156'},
                    {name: 'Restaurante Vermelhas', coordinates: '40.213753,-8.407453'},
                    {name: 'Restaurante da Sereia', coordinates: '40.209764,-8.415792'},
                    {name: 'Restaurante do Estádio Universitário', coordinates: '40.207819,-8.435111'},
                    {name: 'Restaurante S. Jerónimo', coordinates: '40.209036,-8.422592'},
                    {name: 'Grill D. Dinis', coordinates: '40.209075,-8.421978'},
                    {name: 'Cantina do Pólo II', coordinates: '40.1863,-8.414211', address: 'R. Miguel Bombarda, 105, Coimbra, 3030, Portugal' }
                  ])

User.create({email: 'bob@mail.com', password: 'bob1234', password_confirmation: 'bob1234', name: 'bob', telephone: '12345' })

r = Restaurant.create({name: 'Bar de Informática', address: 'R. Miguel Bombarda, 105, Coimbra, 3030, Portugal', coordinates: '40.186708,-8.416133' })

m = Meal.create({name: 'Sandes de salsicha', price: 4.20})

MenuItem.create({date: Time.now, max_reservations: 5, restaurant_id: r.id, meal_id: m.id})

m = Meal.create({name: 'Sandes de frango', price: 4.20})

MenuItem.create({date: Time.now, max_reservations: 100, restaurant_id: r.id, meal_id: m.id})

puts 'Seeded'
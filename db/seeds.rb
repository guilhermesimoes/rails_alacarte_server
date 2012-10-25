# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Reservation.delete_all
Restaurant.delete_all
Meal.delete_all
MenuItem.delete_all

Restaurant.create!([ {   name: 'Restaurante Luzio Vaz',
                         coordinates: '40.2202,-8.417983',
                         image: "http://www.uc.pt/sasuc/imagens/Cantina_Polo-III_1_1.jpg",
                         max_seats: 50
                    },
                    {    name: 'Restaurante Central',
                         coordinates: '40.208572,-8.421364',
                         image: "http://www.uc.pt/sasuc/imagens/salaA.jpg",
                         max_seats: 50
                    },
                    {    name: 'Restaurante Monumentais',
                         coordinates: '40.208564,-8.421353',
                         image: "http://www.uc.pt/sasuc/imagens_destaques/Monumentais_2",
                         max_seats: 50
                    },
                    {    name: 'Sala B',
                         coordinates: '40.208564,-8.421353',
                         image: "http://www.uc.pt/sasuc/imagens/Copia_de_Sala_B_1.jpg",
                         max_seats: 50
                    },
                    {    name: 'Restaurante Amarelas',
                         coordinates: '40.208514,-8.420961',
                         image: "http://www.uc.pt/sasuc/imagens/Amarelas.jpg",
                         max_seats: 50
                    },
                    {    name: 'Vegetariana',
                         coordinates: '40.356831,-8.702553',
                         image: "http://www.uc.pt/sasuc/imagens/Amarela_vegetariana.jpg",
                         max_seats: 50
                    },
                    {    name: 'Sandwich-Bar',
                         coordinates: '40.208467,-8.421025',
                         image: "http://www.uc.pt/sasuc/imagens/Sandwich_bar.jpg",
                         max_seats: 50
                    },
                    {    name: 'Centro Cultural Casa da Pedra',
                         coordinates: '40.18595,-8.417253',
                         image: "http://www.uc.pt/sasuc/imagens/CasaDaPedra2",
                         max_seats: 50
                    },
                    {    name: 'Restaurante das Químicas',
                         coordinates: '40.207417,-8.424156',
                         image: "http://www.uc.pt/sasuc/imagens/Copia_de_Quimicas.jpg",
                         max_seats: 50
                    },
                    {    name: 'Restaurante Vermelhas',
                         coordinates: '40.213753,-8.407453',
                         image: "http://www.uc.pt/sasuc/imagens/Copia_de_ISCA_1.jpg"
                    },
                    {    name: 'Restaurante da Sereia',
                         coordinates: '40.209764,-8.415792',
                         image: "http://www.uc.pt/sasuc/imagens/Copia_de_Sereia.jpg",
                         max_seats: 50
                    },
                    {    name: 'Restaurante do Estádio Universitário',
                         coordinates: '40.207819,-8.435111',
                         image: "http://www.uc.pt/sasuc/imagens/estadio2.jpg",
                         max_seats: 50
                    },
                    {    name: 'Restaurante S. Jerónimo',
                         coordinates: '40.209036,-8.422592',
                         image: "http://www.uc.pt/sasuc/imagens/Hospital_Velho.jpg"
                    },
                    {    name: 'Grill D. Dinis',
                         coordinates: '40.209075,-8.421978',
                         image: "http://www.uc.pt/sasuc/ServicosApoioEstudantes/Alimentacao/2012/Grill_DDinis.JPG",
                         max_seats: 50
                    },
                    {    name: 'Cantina do Pólo II',
                         coordinates: '40.1863,-8.414211',
                         image: "http://www.uc.pt/sasuc/imagens/CAP_II_2.jpg",
                         address: 'R. Miguel Bombarda, 105, Coimbra, 3030, Portugal',
                         max_seats: 50
                    }
               ])

z = User.create!({email: 'z@z.com', password: 'zzzzzzz', password_confirmation: 'zzzzzzz', name: 'bob', telephone: '12345', credits: 200 })

b = User.create!({id: '1', email: 'bob@mail.com', password: 'bob1234', password_confirmation: 'bob1234', name: 'bob', telephone: '12345', credits: 200 })

r = Restaurant.create!({name: 'Bar de Informática', address: 'R. Miguel Bombarda, 105, Coimbra, 3030, Portugal', coordinates: '40.186708,-8.416133', image:"http://www.uc.pt/sasuc/imagens/Copia_de_Polo_II_Informatica.jpg" })

m = Meal.create!({name: 'Sandes de salsicha', price: 4.20, image: 'sausage_sandwich.jpg'})

m2 = MenuItem.create!({date: Date.today+6.days, max_reservations: 5, restaurant_id: r.id, meal_id: m.id})

m = Meal.create!({name: 'Sandes de frango', price: 4.20, image: 'chicken_sandwich.jpg'})

m3 = MenuItem.create!({date: Date.today+5.days, max_reservations: 100, restaurant_id: r.id, meal_id: m.id})

b.reservations.create!([ {menu_item_id: m2.id, time_slot: "1300"},
                         {menu_item_id: m3.id, time_slot: "1400"}
                    ])

puts 'Seeded'

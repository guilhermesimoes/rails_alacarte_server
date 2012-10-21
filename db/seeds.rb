# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.create([ {    name: 'Restaurante Luzio Vaz',
                         coordinates: '40.2202,-8.417983',
                         image: "http://www.uc.pt/sasuc/imagens/Cantina_Polo-III_1_1.jpg"
                    },
                    {    name: 'Restaurante Central',
                         coordinates: '40.208572,-8.421364',
                         image: "http://www.uc.pt/sasuc/imagens/salaA.jpg"
                    },
                    {    name: 'Restaurante Monumentais',
                         coordinates: '40.208564,-8.421353',
                         image: "http://www.uc.pt/sasuc/imagens_destaques/Monumentais_2"
                    },
                    {    name: 'Sala B',
                         coordinates: '40.208564,-8.421353',
                         image: "http://www.uc.pt/sasuc/imagens/Copia_de_Sala_B_1.jpg"
                    },
                    {    name: 'Restaurante Amarelas',
                         coordinates: '40.208514,-8.420961',
                         image: "http://www.uc.pt/sasuc/imagens/Amarelas.jpg"
                    },
                    {    name: 'Vegetariana',
                         coordinates: '40.356831,-8.702553',
                         image: "http://www.uc.pt/sasuc/imagens/Amarela_vegetariana.jpg"
                    },
                    {    name: 'Sandwich-Bar',
                         coordinates: '40.208467,-8.421025',
                         image: "http://www.uc.pt/sasuc/imagens/Sandwich_bar.jpg"
                    },
                    {    name: 'Centro Cultural Casa da Pedra',
                         coordinates: '40.18595,-8.417253',
                         image: "http://www.uc.pt/sasuc/imagens/CasaDaPedra2"
                    },
                    {    name: 'Restaurante das Químicas',
                         coordinates: '40.207417,-8.424156',
                         image: "http://www.uc.pt/sasuc/imagens/Copia_de_Quimicas.jpg"
                    },
                    {    name: 'Restaurante Vermelhas',
                         coordinates: '40.213753,-8.407453',
                         image: "http://www.uc.pt/sasuc/imagens/Copia_de_ISCA_1.jpg"
                    },
                    {    name: 'Restaurante da Sereia',
                         coordinates: '40.209764,-8.415792',
                         image: "http://www.uc.pt/sasuc/imagens/Copia_de_Sereia.jpg"
                    },
                    {    name: 'Restaurante do Estádio Universitário',
                         coordinates: '40.207819,-8.435111',
                         image: "http://www.uc.pt/sasuc/imagens/estadio2.jpg"
                    },
                    {    name: 'Restaurante S. Jerónimo',
                         coordinates: '40.209036,-8.422592',
                         image: "http://www.uc.pt/sasuc/imagens/Hospital_Velho.jpg"
                    },
                    {    name: 'Grill D. Dinis',
                         coordinates: '40.209075,-8.421978',
                         image: "http://www.uc.pt/sasuc/ServicosApoioEstudantes/Alimentacao/2012/Grill_DDinis.jpg"
                    },
                    {    name: 'Cantina do Pólo II',
                         coordinates: '40.1863,-8.414211',
                         image: "http://www.uc.pt/sasuc/imagens/CAP_II_2.jpg",
                         address: 'R. Miguel Bombarda, 105, Coimbra, 3030, Portugal'
                    }
               ])

User.create({email: 'z@z.com', password: 'zzzzzzz', password_confirmation: 'zzzzzzz', name: 'bob', telephone: '12345' })

User.create({email: 'bob@mail.com', password: 'bob1234', password_confirmation: 'bob1234', name: 'bob', telephone: '12345' })

r = Restaurant.create({name: 'Bar de Informática', address: 'R. Miguel Bombarda, 105, Coimbra, 3030, Portugal', coordinates: '40.186708,-8.416133', image:"http://www.uc.pt/sasuc/imagens/Copia_de_Polo_II_Informatica.jpg" })

m = Meal.create({name: 'Sandes de salsicha', price: 4.20})

MenuItem.create({date: Time.now, max_reservations: 5, restaurant_id: r.id, meal_id: m.id})

m = Meal.create({name: 'Sandes de frango', price: 4.20})

MenuItem.create({date: Time.now, max_reservations: 100, restaurant_id: r.id, meal_id: m.id})

puts 'Seeded'
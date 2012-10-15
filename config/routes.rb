RailsAlacarteServer::Application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }
  resources :users, only: [:index, :show]
  resources :reservations
  resources :restaurants
  resources :meals
  resources :menus

  root :to => 'restaurants#index'

  # match '*uri' => redirect('/')
end

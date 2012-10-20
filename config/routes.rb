RailsAlacarteServer::Application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }
  resources :users, only: [:index, :show, :destroy]
  resources :reservations
  resources :restaurants
  resources :meals
  resources :menu_items

  match '/menu_items/:id/menus_by_restaurants', :controller => 'menu_items', :action => 'menus_by_restaurants'


  ['home'].each do |p|
    get "/#{p}", :controller => 'pages', :action => p
  end

  root :to => 'pages#home'

  # match '*uri' => redirect('/')
end

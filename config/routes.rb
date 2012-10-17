RailsAlacarteServer::Application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }
  resources :users, only: [:index, :show, :destroy]
  resources :reservations
  resources :restaurants
  resources :meals
  resources :menu_items

  ['home'].each do |p|
    get "/#{p}", :controller => 'pages', :action => p
  end

  root :to => 'pages#home'

  # match '*uri' => redirect('/')
end

RailsAlacarteServer::Application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }
  resources :users, only: [:index, :show, :destroy]
  resources :reservations
  resources :restaurants
  resources :meals
  resources :menu_items

  match '/menu_items/:id/menus_by_restaurants' => 'menu_items#menus_by_restaurants'

  get '/change_password' => 'passwords#edit', :as => :edit_user_password
  put '/update_password' => 'passwords#update', :as => :update_user_password


  ['home', 'sms_test'].each do |p|
    get "/#{p}", :controller => 'pages', :action => p
  end

  root :to => 'pages#home'

  # match '*uri' => redirect('/')
end

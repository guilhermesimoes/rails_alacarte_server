RailsAlacarteServer::Application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }
  resources :users, only: [:index, :show, :destroy]
  resources :meals
  resources :menu_items
  resources :reservations do
    get 'confirmation', on: :member
  end
  resources :restaurants do
    get 'menu_items', on: :member
    get 'availability', on: :member
  end

  get 'change_password' => 'passwords#edit', :as => :edit_user_password
  put 'update_password' => 'passwords#update', :as => :update_user_password

  post 'send_local_data' => 'pages#send_local_data'
  post 'send_local_reservation' => 'pages#send_local_reservation'

  ['home', 'sms_test'].each do |p|
    get "/#{p}", :controller => 'pages', :action => p
  end

  root :to => 'pages#home'

  # match '*uri' => redirect('/')
end

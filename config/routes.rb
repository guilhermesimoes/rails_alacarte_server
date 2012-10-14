RailsAlacarteServer::Application.routes.draw do
  resources :restaurants

  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }
  resources :users, only: [:index, :show]
  resources :restaurants

  root :to => 'restaurants#index'

  # match '*uri' => redirect('/')
end

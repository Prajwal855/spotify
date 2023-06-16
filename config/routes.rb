Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: "users/registrations"
      }
  

  #songs Endpoint
  get 'songs', to: "songs#index"
  post 'song', to: "songs#create"
  delete 'songs/:id', to: "songs#destroy"

  #artist Endpoints
  get 'artists', to: "artists#index"
  get 'artist/:id', to: "artists#show"
  post 'artist', to: "artists#create"
  put 'artist/:id', to: "artists#update"
  patch 'artist/:id', to: "artists#update"
  delete 'artists/:id', to: "artists#destroy"

   
  # users Endpoint
  get 'users', to: "users#index"
  get 'users/:id', to: "user#show"
  post 'user', to: "users#create"
  put 'user/:id', to: "users#update"
  patch 'user/:id', to: "users#update"
  delete 'users/:id', to: "users#destroy" 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  namespace :api do
    namespace :v1 do
          # get '/users', to: 'users#index'
      resources :users
      resources :airlines
      resources :airports
      resources :tickets
      resources :flights
      namespace 'users' do
      end
      get '/admins', to: 'users#admin'
      post "/login", to: "authentication#authenticate_user"
      # get '/search', to: "tickets#search"
      get '/search', to: "users#search"
      
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

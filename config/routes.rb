Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
          # get '/users', to: 'users#index'
      resources :users
      post "/login", to: "authentication#authenticate_user"
      
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

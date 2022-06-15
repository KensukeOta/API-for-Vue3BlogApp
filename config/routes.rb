Rails.application.routes.draw do
  root "homes#index"
  
  get "/", to: "homes#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope :api do
    post "/users/create", to: "users#create"
    post "/users/login", to: "users#login"
    post "/users/logout", to: "users#logout"

    post "/posts/create", to: "posts#create"
  end
end

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
    
    get "/posts", to: "posts#index"
    get "/posts/:id", to: "posts#show"
    post "/posts/create", to: "posts#create"
    patch "/posts/:id/update", to: "posts#update"
    delete "/posts/:id/destroy", to: "posts#destroy"
  end
end

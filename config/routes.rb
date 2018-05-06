Rails.application.routes.draw do
  root "library_management#home"
  get "/signup", to: "users#new"
  get "/help", to: "library_management#help"

  get "/authors/new", to: "authors#new"
  post "/authors/create", to: "authors#create"

  get "/books/new", to: "books#new"
  post "/books/create", to: "books#create"

  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :authors
  resources :categories
  resources :books
  resources :users
  get "/authors/index", to: "authors#index"
  get "/authors/new", to: "authors#new"
  get "/authors/show", to: "authors#show"
  post "/authors/create", to: "authors#create"

  get "/categories/new", to: "categories#new"
  get "/categories/show", to: "categories#show"
  post "/categories/create", to: "categories#create"

  get "/books/new", to: "books#new"
  post "/books/create", to: "books#create"

end

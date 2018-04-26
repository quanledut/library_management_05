Rails.application.routes.draw do
  root "library_management#home"
  get "/help", to: "library_management#help"

  get "/authors/index", to: "authors#index"
  get "/authors/new", to: "authors#new"
  get "/authors/show", to: "authors#show"
  post "/authors/create", to: "authors#create"

  get "/categories/new", to: "categories#new"
  get "/categories/show", to: "categories#show"
  post "/categories/create", to: "categories#create"

  get "/books/new", to: "books#new"
  post "/books/create", to: "books#create"

  resources :authors
  resources :categories
  resources :books
end

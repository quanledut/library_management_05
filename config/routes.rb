Rails.application.routes.draw do
  root "library_management#home"
  get "/help", to: "library_management#help"

  get "/authors/new", to: "authors#new"
  post "/authors/create", to: "authors#create"

  get "/books/new", to: "books#new"
  post "/books/create", to: "books#create"

  resources :authors
  resources :categories
  resources :books
end

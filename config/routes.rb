Rails.application.routes.draw do
  get 'carts/show'

  root "library_management#home"
  get "/signup", to: "users#new"
  get "/help", to: "library_management#help"

  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :authors
  resources :categories
  resources :books
  resources :users
  resources :borrow_books
  resources :borrows
  resources :carts
end

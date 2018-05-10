Rails.application.routes.draw do
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
end

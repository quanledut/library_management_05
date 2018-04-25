Rails.application.routes.draw do
  root "library_management#home"
  get "/help", to: "library_management#help"
end

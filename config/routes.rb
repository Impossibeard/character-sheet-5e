Rails.application.routes.draw do

  # resources gives us all the CRUD methods we need
  resources :characters

  root "welcome#index"
end

Rails.application.routes.draw do

  # resources gives us all the CRUD methods we need
  resources :characters do
    resources :races, only: [:show]
    resources :hero_class, only: [:show]
  end

  root "welcome#index"
end

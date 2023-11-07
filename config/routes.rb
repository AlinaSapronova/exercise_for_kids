Rails.application.routes.draw do
  root "main#welcome"
  devise_for :users

  get "/profile", to: "profile#show"
  
  resources :exercises
  resources :days
  resources :challenges
  resources :children
 

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

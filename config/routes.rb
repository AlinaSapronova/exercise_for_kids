Rails.application.routes.draw do
  resources :exercises
  resources :days
  resources :challenges
  resources :children
  devise_for :users
  root "main#welcome"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

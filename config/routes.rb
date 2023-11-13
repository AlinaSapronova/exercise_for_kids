Rails.application.routes.draw do
  
  devise_for :users

  get "/profile", to: "profile#show"

  authenticated :user do
    root "challenges#index", as: :authenticated_root
  end

  # landing page if you are not logged in
  root "main#welcome" 
  
  resources :exercises
  resources :days
  resources :challenges
  resources :children
 

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

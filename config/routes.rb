Rails.application.routes.draw do
  
  devise_for :users

  get "/profile", to: "profile#show"

  authenticated :user do
    root "main#welcome", as: :authenticated_root
  end

  # landing page if you are not logged in
  root "main#welcome" 

  resources :days 
  resources :exercises
  resources :challenges
  resources :children
 

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end

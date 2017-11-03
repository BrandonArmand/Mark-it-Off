Rails.application.routes.draw do
  get '/users/show/:id', to: "users#show", as: 'users_show'

  get 'home/index'

  devise_for :users
  
  root to: "home#index"
end

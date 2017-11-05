Rails.application.routes.draw do
  get 'items/create'

  # get '/users/show/:id', to: "users#show", as: 'users_show'
  get 'home/index'

  devise_for :users
  resources :users, :only => [:show] do
    resources :items, :only => [:create]
  end

  root to: "home#index"
end

Rails.application.routes.draw do
  get 'home/index'

  devise_for :users
  resources :users, :only => [:show] do
    resources :items, :only => [:create, :destroy]
  end

  root to: "home#index"
end

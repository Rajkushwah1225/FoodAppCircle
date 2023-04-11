Rails.application.routes.draw do
  get "cuisine/new"
  get "cuisine/create"
  # get "restaurant/index"
  #   devise_for :users
  #   get 'eateries/index'
  root "home#index"
  #  get 'home/restro'

  devise_for :users
  #get "restaurants/new"
  #get "home/restro"
  # get "restaurant/index"
  # get "restaurant/cuisine/index"
  # resources :users
  # resources :cuisine
  
  resources :restaurants do
    resources :cuisines
  end
end

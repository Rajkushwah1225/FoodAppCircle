Rails.application.routes.draw do
  get 'cuisine/new'
  get 'cuisine/create'
  get "restaurant/index"
  #   devise_for :users
  #   get 'eateries/index'
  root "home#index"
  #  get 'home/restro'

  devise_for :users

  #get "home/restro"
  get "restaurant/index"
  get "restaurant/cuisine"
  resources :users
  resources :restaurant do
    resources :cuisine
  end
end

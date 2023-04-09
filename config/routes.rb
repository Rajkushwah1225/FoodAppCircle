Rails.application.routes.draw do
#   devise_for :users
#   get 'eateries/index'
   root "home#index"


#  get 'home/restro'
  
devise_for :users

get "home/restro"

resources :users

end

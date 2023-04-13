Rails.application.routes.draw do
   get 'fooditems/index'
  # get 'fooditems/new'
  # get 'fooditems/create'
  # get 'fooditems/update'
  # get 'fooditems/edit'
  # get 'fooditems/destroy'
  # get  "homes/home"
  
  resources :fooditems
  root "homes#index"
  
  devise_for :users
  resources :restaurants do
     resources :cuisines
  end
end

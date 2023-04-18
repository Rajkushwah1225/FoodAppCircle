Rails.application.routes.draw do
 resources :orders do
  get '/orders/confirmed'
  get '/orders/cancelled'
  get '/orders/rejected'
 end
  
 root "homes#index" 
  resources :homes
    resources :carts do 
      collection do
      get :carts_cuisines
    end
  end
   #get '/orders/confirmed', to: 'orders#confirmed'
   #get '/orders/pending', to: 'orders#pending'
   #get '/orders/cancelled', to: 'orders#cancelled'
  devise_for :users
  resources :restaurants do
     resources :cuisines do
      resources :carts 

     end
  end
end

Rails.application.routes.draw do
 resources :orders
  root "homes#index" 
  resources :homes
  resources :carts do 
    collection do
      get :carts_cuisines
    end
   end
   
   devise_for :users
  resources :restaurants do
     resources :cuisines do
      resources :carts 

     end
  end
end

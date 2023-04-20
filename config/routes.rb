Rails.application.routes.draw do
  resources :orders do
    get "/orders/confirmed"
    get "/orders/cancelled"
    get "/orders/rejected"
  end

  root "homes#index"

  #resources: restaurants , as: "user_restaurant", path: "users/:user_id/restaurant"
  #get '/orders/confirmed', to: 'orders#confirmed'
  #get '/orders/pending', to: 'orders#pending'
  #get '/orders/cancelled', to: 'orders#cancelled'
  devise_for :users

  resource :cart, only: [:show], as: "user_cart", path: "users/:user_id/cart"

  resources :cart do
    resources :cartitems do
      get :increase_quantity
      get :decrease_quantity
      get :remove_item
    end
  end

  resources :restaurants do
    resources :fooditems
  end
end

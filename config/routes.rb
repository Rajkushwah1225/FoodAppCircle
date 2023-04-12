Rails.application.routes.draw do
  root "home#index"
  devise_for :users
  resources :restaurants do
     resources :cuisines
  end
end

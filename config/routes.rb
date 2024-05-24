Rails.application.routes.draw do
  resources :products, only: [:index, :new, :create]
  post 'cart/add_to_cart', to: 'cart#add_to_cart'
  post 'cart/clear_cart', to: 'cart#clear_cart'
  get 'cart/show', to: 'cart#show'
  get 'cart/count', to: 'cart#cart_count'
  resources :orders, only: [:index, :create, :destroy, :show]
  root 'products#index'
end

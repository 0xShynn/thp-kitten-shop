
Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'items#index'
  resources :items
  resources :users, only: [:show, :new, :create] do
    resources :carts, only: [:show]
    resources :orders, only: [:new, :show, :create]
  end
  resources :cart_items, only: [:new, :create, :destroy]

  namespace :admin do
    resources :items, only: [:new, :create, :show, :delete]
    resources :orders, only: [:index]
  end
end
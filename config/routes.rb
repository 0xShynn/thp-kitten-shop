
Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'items#index'
 
  resources :users, only: [:show, :new, :create, :edit, :update] do
    resources :carts, only: [:show]
    resources :orders, only: [:new, :show, :create]
    resources :avatars, only: [:create]
  end
  resources :cart_items, only: [:new, :create, :destroy]
 
  resources :items, only: [:index, :show, :new, :edit] do
    resources :photos, only: [:create]
  end

  resources :orders, only: [:new, :create, :show]

  namespace :admin do
    resources :items, only: [:new, :create, :show, :delete]
    resources :orders, only: [:index]
  end
end
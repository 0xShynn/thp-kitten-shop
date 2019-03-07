Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'items#index'
 
  resources :users, only: [:show, :new, :create, :edit, :update] do
    resources :carts, only: [:show], path: 'panier'
    resources :orders, only: [:new, :show, :create], path: 'commande'
    resources :avatars, only: [:create]
  end
  
  resources :cart_items, only: [:new, :create, :destroy]
<<<<<<< HEAD
 
  resources :items, only: [:index, :show] do
=======
  
  resources :items, only: [:index, :show, :new, :edit], path: 'article' do
>>>>>>> delivery
    resources :photos, only: [:create]
  end
  
  namespace :admin do
    resources :items
    resources :orders, only: [:index, :edit, :destroy]
    resources :cart_items, only: [:destroy]
  end 
  
  resources :admins, only: [:index]

end
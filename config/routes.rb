Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'items#index'
 
  resources :users, only: [:show, :new, :create, :edit, :update], path: 'utilisateurs' do
    resources :carts, only: [:show], path: 'paniers'
    resources :orders, only: [:new, :show, :create], path: 'commandes'
    resources :avatars, only: [:create]
  end
  
  resources :cart_items, only: [:new, :create, :destroy], path: 'contenu-panier'
  
  resources :items, only: [:index, :show, :new, :edit], path: 'articles' do
    resources :photos, only: [:create]
  end
  
  namespace :admin do
    resources :items, path: 'articles'
    resources :orders, only: [:index, :edit, :destroy], path: 'commandes'
    resources :cart_items, only: [:destroy]
  end 
  
  resources :admins, only: [:index]

end
Rails.application.routes.draw do
  # ActiveAdmin routes
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  # User authentication routes
  devise_for :users
  
  # Application routes
  root 'home#index'
  
  # Resource routes
  resources :products
  resources :categories
  resources :orders
  resources :crate_types
  
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
end 
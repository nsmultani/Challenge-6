Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Root route
  root 'customers#index'
  
  # Custom customer routes
  get '/customers/alphabetized', to: 'customers#alphabetized'
  get '/customers/missing_email', to: 'customers#missing_email'
  
  # Standard customers resource (if needed for future expansion)
  resources :customers, only: [:index]
end
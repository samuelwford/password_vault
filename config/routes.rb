Rails.application.routes.draw do
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  
  resources :sessions
  resources :users
  resources :groups
  resources :accounts
  
  root 'welcome#index'
end

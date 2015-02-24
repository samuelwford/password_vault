Rails.application.routes.draw do
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  
  get "/auth/:provider/callback" => "sessions#omniauth_callback"
  
  resources :sessions
  resources :password_resets
  resources :users
  resources :groups
  resources :accounts
  
  root 'welcome#index'
end

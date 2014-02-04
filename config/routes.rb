Rails.application.routes.draw do
  
  devise_for :users
  resources :users, only: [:create, :update]
  resources :messages, only: [:create, :update]
  
  namespace :admin do
    resources :users
    resources :messages
  end

end

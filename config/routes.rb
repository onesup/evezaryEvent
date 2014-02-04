Rails.application.routes.draw do
  
  get "home/index"
  get "home/mobile"
  get "mobile_form" => "home#mobile_apply_1"
  get "home/mobile_apply_2"
  get "home/popUp_1"
  get "home/popUp_2"
  get "home/popUp_3"
  get "home/popUp_4"
  get "home/popUp_5"
  get "home/popUp_blog"
  get "home/web"

  devise_for :users
  resources :users, only: [:create, :update]
  resources :messages, only: [:create, :update]
  
  namespace :admin do
    resources :users
    resources :messages
  end
  root :to => "home#index"
end

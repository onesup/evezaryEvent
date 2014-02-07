Rails.application.routes.draw do

  get "mobile_index" => "mobile#index"
  get "mobile_apply_1" => "mobile#apply_1"
  get "mobile_apply_2" => "mobile#apply_2"
  get "mobile_person" => "mobile#person"
  get "near_stores" => "mobile#near_stores"
  get "home_index" => "home#index"
  get "home_popup_1" => "home#popUp_1"
  get "home_popup_2" => "home#popUp_2"
  get "home_popup_3" => "home#popUp_3"
  get "home_popup_4" => "home#popUp_4"
  get "home_popup_5" => "home#popUp_5"
  get "home_popup_6" => "home#popUp_6"
  get "home_popup_blog" => "home#popUp_blog"
  get "blog_image_download" => "home#download_image"
  devise_for :users
  resources :users, only: [:create, :update]
  resources :messages, only: [:create, :update]
  
  namespace :admin do
    resources :users
    resources :messages
  end
  root :to => "home#switch"
end

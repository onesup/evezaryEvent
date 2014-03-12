Rails.application.routes.draw do
  
  

  get "mobile_index"          => "mobile#index"
  # get "mobile_apply_1"        => "mobile#apply_1"
  # get "mobile_apply_2"        => "mobile#apply_2"
  # get "mobile_apply_3"        => "mobile#apply_3"
  # get "mobile_search_stores"  => "mobile#search_stores"
  # get "mobile_person"         => "mobile#person"
  # get "mobile_kakaotalk"      => "mobile#kakaotalk"
  # get "mobile_kakaostory"     => "mobile#kakaostory"
  # get "mobile_facebook"       => "mobile#facebook"
  get "near_stores"           => "mobile#near_stores"
  get "home_index"            => "home#index"
  # get "home_popup_1"          => "home#popUp_1"
  # get "home_popup_2"          => "home#popUp_2"
  # get "home_popup_3"          => "home#popUp_3"
  # get "home_popup_4"          => "home#popUp_4"
  # get "home_popup_5"          => "home#popUp_5"
  # get "home_popup_6"          => "home#popUp_6"
  # get "home_popup_blog"       => "home#popUp_blog"
  get "blog_image_download"   => "home#download_image"
  get '/:id', to: 'users#tracking_log', constraints: { id: /e.+-\d.+/ }
  devise_for :users
  # resources :users, only: [:create, :update] do
  #   collection do
  #     post 'search_stores'
  #   end
  # end
  # resources :messages, only: [:create, :update]
  resources :viral_actions, only: [:create]
  namespace :mobile do
    # resources :messages, only: [:create]
    # resources :viral_actions, only: [:create]
  end
  namespace :mobile_buzz do
    # resources :users, only: [:new, :create]
  end
  # namespace :viral do
  #   namespace :web do
  #     resources :users
  #   end
  #   namespace :mobile do
  #     resources :users
  #   end
  # end
  namespace :admin do
    get '/' => 'dashboard#index', ad: 'admin'
    resources :users
    resources :gifts
    resources :messages
    resources :access_logs
    resources :viral_actions
    resources :stores do
      collection do
        get "top_stores"
      end
      resources :messages do
      end
    end
    get '/gift_mobile_users' => 'gifts#mobile_users', ad: 'admin'
  end
  root :to => "home#switch"
end

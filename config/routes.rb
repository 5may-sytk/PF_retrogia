Rails.application.routes.draw do
  namespace :public do
    get 'favorites/index'
  end
  namespace :admin do
    resources :users, only: [:index, :show, :destroy]
    resources :posts, only: [:index, :show, :destroy] do 
      resources :post_comments, only: [:destroy]
      collection do
        get 'withdrawal'
      end
    end
  end

  namespace :public do
    resources :users, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get "followings" => "relationships#followings", as: "followings"
      get "followers" => "relationships#followers", as: "followers"
      collection do
        get 'confirmation'
        patch 'leave'
      end
    end

    resources :posts do
      collection do
        get 'following_feed'
      end
      resources :post_comments, only: [:index, :create, :destroy]
      resources :bookmarks, only: [:index, :create, :destroy]
      resources :favorites, only: [:index, :create, :destroy]
      get "bookmarked_posts" => "posts#bookmarked"
    end
  end
  
  root to: "homes#top"
  get 'home/about' => 'homes#about', as:'about'
  get "search" => "searches#search"


  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
  }

  devise_for :users, skip: [:passwords], controllers: {
    sessions:      'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations'
  }

  devise_scope :user do
    get "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :posts do
      resources :post_comments, only: [:destroy]
    end
  end

  namespace :public do
    resources :users, only: [:show, :edit, :update, :destroy] do
      resource :relationships, only: [:create, :destroy]
      get "followings" => "relationships#followings", as: "followings"
      get "followers" => "relationships#followers", as: "followers"
    end

    resources :posts do
      collection do
        get 'following_feed'
      end
      resources :post_comments, only: [:create, :destroy]
      resources :bookmarks, only: [:create, :destroy]
      get "bookmarked_posts" => "posts#bookmarked"
    end
  end
  
  root to: "homes#top"
  get 'home/about' => 'homes#about', as:'about'


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
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

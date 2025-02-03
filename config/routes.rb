Rails.application.routes.draw do

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update, :destroy]
  end
  namespace :public do
    resources :users, only: [:show, :edit, :update, :destroy]
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

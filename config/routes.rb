Rails.application.routes.draw do

 # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # ユーザー用
  # URL /users/sign_in ...
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  # ゲスト用
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  root to: "public/homes#top"
  get "search" => "searches#search"

  scope module: :public do
    get "about" => "homes#about"
    get "user/confirm" => "users#confirm"
    get "search_tag" => "reviews#search_tag"
    resources :maps, only: [:index]
    resources :countries, only: [:index, :show]
    resources :genres, only: [:index, :show]

    resources :reviews, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :review_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
      resource :bookmarks, only: [:create, :destroy]
    end

    resources :users, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      member do
        get "manage"
        get "bookmark"
        get "quit"
        patch "out"
      end
      # フォロー/フォロワー一覧
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end

  end

  namespace :admin do
    get "/" => "homes#top"
    get "search_tag" => "reviews#search_tag"
    resources :countries, only: [:new, :index, :show, :edit, :update]
    resources :reviews, only: [:index, :show, :edit, :update, :destroy] do
      resources :review_comments, only: [:destroy]
    end
    resources :users, only: [:index, :show, :edit, :update] do
      member do
        get 'confirm'
      end
    end
    resources :genres, only: [:index]
    resources :maps, only: [:index]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

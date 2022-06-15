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
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  root to: "public/homes#top"

  scope module: :public do
    get "about" => "homes#about"
    get "reviews/confirm" => "reviews#confirm"
    resources :maps, only: [:index]
    resources :countries, only: [:index, :show]
    resources :reviews, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :favorites, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update]

    # フォロー/フォロワー一覧
    resources :users do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end

    patch "users/withdraw" => "users#withdraw"
    get "users/quit" => "users#quit"
  end

  namespace :admin do
    get "/" => "homes#top"
    resources :countries, only: [:new, :index, :show, :edit, :update]
    resources :reviews, only: [:index, :show, :destroy]
    resources :users, only: [:index, :show, :edit]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

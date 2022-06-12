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
    sessions: "admin/sessions"
  }

  root to: "public/homes#top"

  scope module: :public do
    get "about" => "homes#about"
    get "reviews/confirm" => "reviews#confirm"
    resources :countries, only: [:index, :show]
    resources :reviews, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :favorites, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update]

    putch "users/withdraw" => "users#withdraw"
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

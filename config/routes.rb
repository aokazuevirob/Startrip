Rails.application.routes.draw do

  get 'countries/index'
  get 'countries/show'
  get 'reviews/new'
  get 'reviews/index'
  get 'reviews/show'
  get 'reviews/edit'
  get 'users/show'
  get 'users/edit'
  get 'homes/top'
  get 'homes/about'
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

  root to: 'public/homes#top'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

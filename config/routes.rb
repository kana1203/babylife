Rails.application.routes.draw do

  devise_for :users
  root "posts#index"
  resources :posts do
    resource :favorites, only: [:create, :destroy, :show]
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :comments, only: :destroy
  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  resources :genres, only: :show
end

Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :posts do
    resources :comments, only: :create
  end
  resources :comments, only: :destroy
  resources :users, only: :show
  resources :genres, only: :show
end

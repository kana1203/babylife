Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :posts, only: [:new, :create, :destroy, :edit, :update, :show]
  resources :users, only: :show
  resources :genres, only: :show
end

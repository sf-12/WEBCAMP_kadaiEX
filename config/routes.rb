Rails.application.routes.draw do
  devise_for :users
  root to:'homes#top'
  get 'home/about', to: 'homes#about'
  resources :users, only: [:index, :show, :edit, :update] do
    resources :relationships, only: [:create, :destroy]
    get 'relationships/following', to: 'relationships#following'
    get 'relationships/follower', to: 'relationships#follower'
  end
  
  resources :books, only: [:index, :show, :create, :edit, :update, :destroy] do
    resources :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end




end

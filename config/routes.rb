Rails.application.routes.draw do
  get 'books/index'
  get 'books/show'
  get 'user/index'
  get 'user/show'
  devise_for :users

  root to:'homes#top'
  get 'home/about', to: 'homes#about'
  # resources :users, only: [:show]
  resources :users, only: [:index, :show]
  resources :books, only: [:index, :show]
end

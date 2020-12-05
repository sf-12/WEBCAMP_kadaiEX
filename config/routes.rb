# frozen_string_literal: true

Rails.application.routes.draw do
  get 'samples/show'
  devise_for :users, controllers: {
    # controllerのオーバーライド
    registrations: 'users/registrations'
  }
  root to: 'homes#top'
  get 'home/about', to: 'homes#about'
  resources :users, only: %i[index show edit update] do
    resources :relationships, only: %i[create destroy]
    get 'relationships/following', to: 'relationships#following'
    get 'relationships/follower', to: 'relationships#follower'

    # チャット機能
    resources :rooms, only: %i[show create] do
      resources :chats, only: [:create]
    end
  end

  resources :books, only: %i[index show create edit update destroy] do
    resources :favorites, only: %i[create destroy]
    resources :book_comments, only: %i[create destroy]
  end

  get 'searches/result', to: 'searches#search'
end

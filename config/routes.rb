Rails.application.routes.draw do
  devise_for :users, :controllers => {
    # controllerのオーバーライド
    :registrations  => 'users/registrations'
  }
  root to:'homes#top'
  get 'home/about', to: 'homes#about'
  resources :users, only: [:index, :show, :edit, :update] do
    resources :relationships, only: [:create, :destroy]
    get 'relationships/following', to: 'relationships#following'
    get 'relationships/follower', to: 'relationships#follower'

    # チャット機能
    resources :rooms, only: [ :show, :create] do
      resources :chats, only: [ :create]
    end
  end

  resources :books, only: [:index, :show, :create, :edit, :update, :destroy] do
    resources :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  get 'searches/result', to: 'searches#search'

end

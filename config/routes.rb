Rails.application.routes.draw do
  get 'cities', to: 'cities#index'
  get 'rooms/show'
  get '/localfoods/search', to: 'localfoods#search'
  # devise_for :users
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                    sessions: 'users/sessions' }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] # ユーザーマイページへのルーティング
  resources :messages, :only => [:create]
  resources :rooms, :only => [:index, :create, :show]

  resources :localfoods do
    resources :likes, only: [:create, :destroy]
  end
  
  resources :localfoods do
    resources :recommendations, only: [:create, :destroy]
  end
  
    resources :relationships, only: [:create, :destroy]
  
  root 'localfoods#index'

end

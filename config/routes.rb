Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'top', to: 'pages#top'
  resources :books do
    resources :reviews, only: [:new, :create]
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:destroy]
  resources :reviews, only: [:destroy, :edit, :update]
  resources :users, only: [:show, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

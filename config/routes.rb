Rails.application.routes.draw do
  get 'static_pages/home'

  resources :events

  devise_for :users

  resources :users, only: [:show]

  resources :attends, only: [:create, :destroy]
 
  root 'events#index'
end

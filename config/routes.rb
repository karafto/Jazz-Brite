Rails.application.routes.draw do
  resources :events

  devise_for :users

  resources :users, only: [:show]

  resources :attends, only: [:create, :destroy]
 
  root 'events#index'
end

Rails.application.routes.draw do
  resources :events

  devise_for :users

  resources :users, only: [:show]
 
  root 'events#index'
end

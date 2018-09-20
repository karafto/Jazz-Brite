Rails.application.routes.draw do

  get 'static_pages/home'

  resources :events

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:show]

  resources :attends, only: [:create, :destroy]
 
  root 'static_pages#home'
end

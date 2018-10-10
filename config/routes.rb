Rails.application.routes.draw do

  get 'static_pages/home'

  resources :events

  resources :invites

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords' }

  resources :users, only: [:show]

  resources :attends, only: [:create, :destroy]
 
  root 'static_pages#home'
end

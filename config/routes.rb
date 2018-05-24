Rails.application.routes.draw do
  get 'events/new'

  get 'events/create'

  get 'events/show'

  get 'events/index'

  get 'events/edit'

  get 'events/delete'

  devise_for :users
 
  root 'events#index'
end

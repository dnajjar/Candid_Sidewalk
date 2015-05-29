Rails.application.routes.draw do
  
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  root "incidents#index"
  resources :incidents, only: [:new, :create, :index, :show]

  resources :users, only: [:show, :edit, :update]

  get '/sign-up', to: 'users#new'
  post '/sign-up', to: 'users#create'
  delete '/delete-account', to: 'users#destroy'

  get '/sign-in', to: 'sessions#new'
  post '/sign-in', to: 'sessions#create'
  delete '/sign-out', to: 'sessions#destroy'

end

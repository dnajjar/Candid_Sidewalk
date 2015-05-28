Rails.application.routes.draw do
  resources :users

  root "incidents#new"
  resources :incidents, only: [:new, :create, :index, :show]

end

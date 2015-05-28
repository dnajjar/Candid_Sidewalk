Rails.application.routes.draw do
  resources :users

  root "incidents#index"
  resources :incidents, only: [:new, :create, :index, :show]

end

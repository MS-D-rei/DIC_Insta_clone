Rails.application.routes.draw do
  root 'users#index'
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :posts, only: %i[new create edit update destroy]
end

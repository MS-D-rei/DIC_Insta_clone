Rails.application.routes.draw do
  root 'users#index'
  resources :users do
    member do
      get :favorites
    end
  end
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :posts, only: %i[new create edit update destroy] do
    collection do
      post :confirm
    end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :favorites, only: %i[create destroy]
end

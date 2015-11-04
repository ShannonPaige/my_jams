Rails.application.routes.draw do
  root to: 'songs#index'

  get 'users/username'
  get 'users/password_digest'

  resources :songs
  resources :users, only: [:new, :create, :show]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :categories
  end
end

Rails.application.routes.draw do
  get 'users/username'

  get 'users/password_digest'

  resources :songs
  resources :users, only: [:new, :create, :show]
end

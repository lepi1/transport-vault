Rails.application.routes.draw do
  resources :users, only: %i[new create]

  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  get 'logout', to: 'sessions#destroy'

  get 'authorized', to: 'sessions#page_requires_login'

  get 'signup', to: 'users#new'

  root 'sessions#welcome'
end

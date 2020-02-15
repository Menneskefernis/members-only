Rails.application.routes.draw do
  root 'posts#index'
  resources :posts, only: [:index, :new, :create]
  get '/post',      to: 'posts#new'
  post '/post',     to: 'posts#create'
  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end

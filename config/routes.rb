Rails.application.routes.draw do
  root 'posts#index'
  get 'posts/new'
  get 'posts/create'
  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end

Rails.application.routes.draw do
  root 'welcome#home'
  delete '/sessions', to: 'sessions#signout'
  post '/sessions', to: 'sessions#create'
  get '/signin', to: 'sessions#signin'
  resources :rides
  get 'rides/create'
  resources :attractions
  get 'attractions/index'
  get 'attractions/show'
  resources :users
  get 'users/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

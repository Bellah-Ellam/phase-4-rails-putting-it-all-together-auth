Rails.application.routes.draw do
  resources :users, only: [:create, :show]
  resources :sessions, only: [:create]
  resources :recipes, only: [:index, :create]

  post '/login', to: 'sessions#create'
  post '/signup', to: 'users#create'
  delete '/logout', to: 'sessions#destroy'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

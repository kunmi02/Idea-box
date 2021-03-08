Rails.application.routes.draw do
  root to: 'users#sign_in'
  get 'log-in', to: 'session#log_in'
  get 'log-out', to: 'session#log_out'
  resources :followings
  resources :users
  resources :ideas, only: [:create, :index, :show, :new]
  get '/recovery', to: 'users#recovery'
  get '/username', to: 'users#_get_username'
  delete '/unfollow', to: 'followings#unfollow'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

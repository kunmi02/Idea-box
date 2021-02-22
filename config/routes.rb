Rails.application.routes.draw do
  root to: 'users#sign_in'
  get 'log-in', to: 'session#log_in'
  resources :followings
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'session/new'

  get 'users/new'

  # get 'welcome/index'
  resources :articles do
    resources :comments
  end
  root 'welcome#index'

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  resources :users

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :account_activations, only: [:edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

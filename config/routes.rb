Isale::Engine.routes.draw do
  # API
  namespace :v1 do
    get 'products', to: 'products#index'
  end

  root to: "home#index"
  resources :users
  resources :addresses
  resources :customers
  resources :imports
  resources :tags
  resources :suppliers
  resources :products do
    get 'restore', to: 'restore'
  end
  resources :contries
  resources :categories do
    resources :tags
  end
  # TODO remove this path
  get    'utility/upload_token'

  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'users#login'
  post   '/login',   to: 'users#session_create'
  delete '/logout',  to: 'users#session_destroy'
end

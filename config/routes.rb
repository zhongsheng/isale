Isale::Engine.routes.draw do
  root to: "home#index"
  resources :users
  resources :addresses
  # TODO add customers login
  resources :customers
  resources :imports
  resources :tags
  resources :suppliers
  resources :products
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

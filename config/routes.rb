Isale::Engine.routes.draw do
  resources :addresses
  resources :customers
  resources :imports
  resources :tags
  resources :suppliers
  resources :categories do
    resources :tags
  end
  resources :contries
  get 'utility/upload_token'
  root to: "home#index"
  resources :products
end

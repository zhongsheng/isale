Rails.application.routes.draw do
  devise_for :users
  mount Isale::Engine => "/isale"
  root to: "home#index"
end

Rails.application.routes.draw do
  mount Isale::Engine => "/isale"
  root to: "home#index"
end

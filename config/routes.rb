Rails.application.routes.draw do
  root "users#index"

  resources :users
  resources :books
  resources :comments
end

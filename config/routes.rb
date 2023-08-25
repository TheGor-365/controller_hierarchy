Rails.application.routes.draw do
  resources :books
  root "users#index"
  resources :users
end

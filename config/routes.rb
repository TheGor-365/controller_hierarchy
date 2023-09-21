Rails.application.routes.draw do
  namespace :api do
  end

  scope module: :web do
    namespace :admin do
    end

    root 'books#index'

    shallow do
      scope module: :books do
        resources :books, only: [:index] do
          resources :comments, except: [:edit, :update]
        end
      end

      resources :users do
        resources :books
        resources :comments, only: [:index]
      end
    end
  end
end

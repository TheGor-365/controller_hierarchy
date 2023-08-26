Rails.application.routes.draw do
  namespace :api do
  end

  scope module: 'web' do
    namespace :admin do
    end

    root 'web/books#index'

    shallow do
      scope module: :books do
        resources :books, only: :index do
          resources :comments, except: [:edit, :update]
        end
      end

      resources :users do
        resources :books
        resources :comments, only: [:index]
      end
    end
  end

  # concerns: :commentable do
  #   resources :comments
  # end
  #
  # shallow do
  #   resources :books, only: :index, concerns: :commentable
  #
  #   resources :users, concerns: :commentable do
  #     resources :books
  #   end
  # end
end

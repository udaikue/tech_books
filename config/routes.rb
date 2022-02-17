Rails.application.routes.draw do
  root to: 'books#index'

  namespace :api do
    resources :books, only: %i[show]
  end

  resources :books
end

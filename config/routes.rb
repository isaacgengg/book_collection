Rails.application.routes.draw do
  resources :user_books
  resources :users
  resources :books do
    member { get :confirm_delete }
  end

  root "user_books#index"

  # health check (keep)
  get "up" => "rails/health#show", as: :rails_health_check
end

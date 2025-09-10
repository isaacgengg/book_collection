Rails.application.routes.draw do
  resources :books do
    member { get :confirm_delete }
  end

  root "books#index"

  # health check (keep)
  get "up" => "rails/health#show", as: :rails_health_check
end

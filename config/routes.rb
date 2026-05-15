Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  get "/health", to: "health#show"

  namespace :api do
    namespace :v1 do
      resources :users, only: [ :show, :create ]
      post "files/upload", to: "files#upload"
      get  "files/fetch",  to: "files#fetch"
    end
  end
end

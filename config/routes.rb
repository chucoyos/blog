Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  root 'articles#index'
  get '/articles', to: 'articles#index'
  get '/articles/show/:id', to: 'articles#show'
  # Defines the root path route ("/")
  # root "posts#index"
end

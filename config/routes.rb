Rails.application.routes.draw do
  require "sidekiq/web" 
  mount Sidekiq::Web => "/sidekiq"

  devise_for :users

  get "/authentication_providers", to: "authentication_providers#select_providers"
  get "/auth/:provider/callback", to: "authentication_providers#create"

  get "/dashboard", to: "dashboard#index"
  get "/list", to: "list#index"
  get "/users/sign_out", to: "application#user_sign_out"
  root to: "home#index"
end

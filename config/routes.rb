Rails.application.routes.draw do
  devise_for :accounts

 root "home#index"

  get "reports/index"
  get "/dashboard", to: "dashboard#index"
  get "/reports", to: "reports#index"
  # Routes for categories (no show route defined)
  resources :categories, only: [ :index, :new, :destroy, :create, :edit, :update ]

  # Resources for other sections
  resources :transactions
  resources :reports
  get "settings", to: "settings#index"
  patch "settings/update_profile", to: "settings#update_profile"
  patch "settings/update_password", to: "settings#update_password"
  patch "settings/update_preferences", to: "settings#update_preferences"
  delete "settings/delete_account", to: "settings#destroy_account"
end

Rails.application.routes.draw do
  resources :budgets, only: [ :new, :create, :index ]
  root "budgets#index"
end

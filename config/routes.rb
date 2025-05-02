Rails.application.routes.draw do
  get "welcome/index"
  devise_for :users
  resources :transactions
  resources :categories
  resources :budgets, only: [:new, :create, :index]
  resources :incomes
  resources :expenses
  
  # Dashboard as the root for authenticated users
  authenticated :user do
    root 'dashboard#show', as: :authenticated_root
  end
  
  # Landing page for unauthenticated users
  root 'welcome#index'
end

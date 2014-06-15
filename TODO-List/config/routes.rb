Rails.application.routes.draw do
  root to: "homes#index"
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :edit, :update]
  resources :items, except: :show
end

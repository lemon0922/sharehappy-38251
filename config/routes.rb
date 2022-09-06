Rails.application.routes.draw do
  devise_for :users
  root to: 'tops#index'
  resources :events
  resources :users, only: [:show, :edit, :update]
end

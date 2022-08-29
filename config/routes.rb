Rails.application.routes.draw do
  root to: 'tops#index'
  resources :events, only: [:index, :new, :create, :edit, :update]
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'tops#index'
  resources :events
  resources :users, only: :show

  devise_scope :user do
    get 'signin' => 'devise_token_auth/sessions#new'
    post 'signin' => 'devise_token_auth/sessions#create'
    post 'signup' => 'users#create'
    put 'update' => 'users#update'
  end

end

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :update]
  resources :transactions, only: [:index, :new, :create, :show, :destroy]
  resources :products do
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:destroy]
end

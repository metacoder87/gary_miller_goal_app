Rails.application.routes.draw do
  resources :users, only: [:index, :show, :new, :create]
  resources :session, only: [:new, :create, :destroy]
  root to: 'users#index'

  resources :goals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :comments, only: [:create]
  resources :cheers, only: [:index]
  resources :goals do
    resources :cheers, only: [:create]
  end
  resources :users, only: [:index, :show, :new, :create]
  post "/users/new", to: "users#create"
  resources :session, only: [:new, :create, :destroy]
  root to: 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

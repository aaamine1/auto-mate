Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :vending_machines do
    resources :bookings, only: [:new, :create]
    resources :items, only: [:index, :new, :create, :edit, :update, ]
  end
  resources :items, only: :destroy
  resources :users do
    resources :bookings, only: [:index, :edit, :update]
  end
  # subject to further validation / conversation with team
  get '/dashboard_vendor', to: 'pages#dashboard_vendor'
  get '/dashboard_refiller', to: 'pages#dashboard_refiller'
end

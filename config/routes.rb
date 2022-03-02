Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :vending_machines do
    resources :bookings, only: [:create]
    resources :items, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  resources :users do
    resources :bookings, only: [:index, :edit, :update]
  end
  resources :products, only: [:index, :new, :create, :edit, :update]
  # subject to further validation / conversation with team
  get '/dashboard', to: 'pages#dashboard', as: :dashboard
end

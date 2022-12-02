Rails.application.routes.draw do
  resources :bookings, only: [:index, :show, :create, :destroy]
  resources :doctors
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

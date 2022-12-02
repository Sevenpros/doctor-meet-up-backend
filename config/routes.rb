Rails.application.routes.draw do
  resources :doctors
  resources :users do
    resources :bookings, only: [:index, :show, :create, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

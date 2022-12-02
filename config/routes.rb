Rails.application.routes.draw do
  resources :doctors only: [:new, :create, :index, :show]
  resources :users only: [:new, :create] do
    resources :bookings, only: [:new, :index, :show, :create, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

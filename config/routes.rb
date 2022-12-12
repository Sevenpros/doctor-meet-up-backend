Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :doctors, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:new, :create, :index] do
    resources :bookings, only: [:new, :index, :show, :create, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

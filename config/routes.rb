Rails.application.routes.draw do

  get 'bookings/new'
  get 'bookings/create'
  devise_for :users
  root to: 'pages#home'
  resources :restaurants do
    resources :bookings, only: [:new, :create]
  end
  get '/my-bookings', to: "dashboard#my_bookings"
  get '/my-restaurants', to: "dashboard#my_restaurants"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

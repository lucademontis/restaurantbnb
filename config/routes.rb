Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  resources :restaurants do
    resources :bookings, only: [:new, :create, :edit, :update, :destroy]
  end
  get '/my-bookings', to: "dashboard#my_bookings"
  get '/my-restaurants', to: "dashboard#my_restaurants"
  get '/booking-requests', to: "dashboard#booking_requests"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

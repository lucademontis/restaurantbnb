Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  resources :restaurants do
    resources :bookings, only:[:new, :create]
  end
  get '/my-bookings' to "dashboard#mybookings"
  get '/my-restaurants' to "dashboard#myrestaurants"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

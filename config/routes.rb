Rails.application.routes.draw do
  root  'bookings#new'

  devise_for :users
  
  get   '/home',                to: 'pages#home'
  get   '/contact',             to: 'pages#contact'
  post  '/contact',             to: 'pages#contact_email'

  get   '/profile',             to: 'profiles#show'
  post  '/profile',             to: 'profiles#create'
  get   '/profile/edit',        to: 'profiles#edit'
  patch '/profile',             to: 'profiles#update'

  get   '/passenger_bookings',  to: 'profiles#passenger_bookings'
  get   '/driver_bookings',     to: 'profiles#driver_bookings'

  get   '/car',                 to: 'cars#show'
  post  '/car',                 to: 'cars#create'
  get   '/car/edit',            to: 'cars#edit'
  patch '/car',                 to: 'cars#update'

  get   '/driver',              to: 'driver_profiles#show'
  post  '/driver',              to: 'driver_profiles#create'
  get   '/driver/edit',         to: 'driver_profiles#edit'
  patch '/driver',              to: 'driver_profiles#update'

  resources :bookings do
    member do
      post 'charge'
    end
    resources :reviews, only: [:new, :create, :show]
  end
end
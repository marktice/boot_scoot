Rails.application.routes.draw do
  root  'pages#home'

  devise_for :users
  
  get   '/contact',         to: 'pages#contact'
  post  '/contact',         to: 'pages#contact_email'
  
  get   '/profile',         to: 'profiles#show'
  post  '/profile',         to: 'profiles#create'
  get   '/profile/edit',    to: 'profiles#edit'
  patch '/profile',         to: 'profiles#update'

  get   '/car',             to: 'cars#show'
  post  '/car',             to: 'cars#create'
  get   '/car/edit',        to: 'cars#edit'
  patch '/car',             to: 'cars#update'
end

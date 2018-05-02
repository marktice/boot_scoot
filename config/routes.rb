Rails.application.routes.draw do
  root 'pages#home'

  get   '/profile',         to: 'profiles#show'
  post  '/profile',         to: 'profiles#create'
  get   '/profile/edit',    to: 'profiles#edit'
  patch '/profile',         to: 'profiles#update'

  get   'pages/contact'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users do
    resources :studios
    resources :bookings
  end

  resources :studios do
    resources :rooms
  end

  resources :rooms do
    resources :bookings
    resources :items
  end

  resources :bookings do
    resources :reviews
  end

  resources :chatrooms, only: :show

  resources :jams
  resources :jams_users

  resources :jams do
    resources :jams_users
  end 

end

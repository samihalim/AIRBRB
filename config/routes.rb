Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :desks do
    resources :bookings, shallow: true
  end
  get "my_bookings", to:"bookings#my_bookings"
  get "my_desks", to:"desks#my_desks"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

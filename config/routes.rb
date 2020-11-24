Rails.application.routes.draw do
  devise_for :users
  root to: 'desks#index'
  resources :desks do
    resources :bookings, only: :create
  end

  resources :bookings, except: :create
  get "my_bookings", to:"bookings#my_bookings"
  get "my_desks", to:"desks#my_desks"

  # For further details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

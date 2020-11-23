Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :desks, only: [:show, :new, :create, :destroy, :edit] do
    resources :bookings, only: [:index, :new, :create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

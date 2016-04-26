Rails.application.routes.draw do
  resources :tasks
  resources :geolocations, only: :create, defaults: {format: :json}
  post 'accept_deny' => 'battle#accept_deny'
  resources :users, only: [:create, :show]
end


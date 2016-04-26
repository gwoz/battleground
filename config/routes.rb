Rails.application.routes.draw do
  resources :tasks
  resources :geolocations, only: :create, defaults: {format: :json}
  resources :users, only: [:create, :show]
	patch '/battle/decline', to: 'battles#decline'
end


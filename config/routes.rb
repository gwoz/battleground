Rails.application.routes.draw do
  resources :geolocations, only: :create, defaults: {format: :json}
  resources :users, only: [:create, :show, :index]
	patch '/battle/decline', to: 'battles#decline'
	patch '/battle/quickdraw', to: 'battles#quickdraw'
end


Rails.application.routes.draw do

  # You can have the root of your site routed with "root"
   # root 'welcome#index'
  resources :tasks
  resources :geolocations, only: :create, defaults: {format: :json}

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  resources :users, only: [:create, :show]
end


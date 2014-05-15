Umanage::Engine.routes.draw do
	resources :sessions, only: [:new, :create, :destroy]
	
	match '/signin', to: 'sessions#new', via: 'get'
  	match '/signout', to: 'sessions#destroy', via: 'get'
end

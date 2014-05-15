Rails.application.routes.draw do
  root 'bees#index'
  
  mount Umanage::Engine => "/umanage"
  resources :bees
end

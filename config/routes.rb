Rails.application.routes.draw do
  resources :orders
	root 'listings#index'
  devise_for :users
  resources :listings
  get 'pages/about'
  get 'pages/contact'
  get 'seller' => "listings#seller"

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

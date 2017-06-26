Rails.application.routes.draw do
  
	root 'listings#index'
	
  devise_for :users
  resources :listings do
  	resources :orders, only: [:new, :create]
  end

  get 'pages/about'
  get 'pages/contact'
  get 'seller' => "listings#seller"
  get 'sales' => "orders#sales"
  get 'purchases' => "orders#purchases"

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

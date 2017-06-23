Rails.application.routes.draw do
	root 'listings#index'
  devise_for :users
  resources :listings
  get 'pages/about'
  get 'pages/contact'

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

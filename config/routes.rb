Rails.application.routes.draw do
	root to: 'visitors#index'
	devise_for :users
	resources :users
	resources :pages do
  	collection do
    	get :about
  	end
 	end
end

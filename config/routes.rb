Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :pages do
    collection do
      get :about
    end
  end
  resources :categories
  resources :quiz do
    collection do
      get :question
      get :summary
    end
    get :review
  end
end

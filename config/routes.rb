Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
  registerable: 'users/registrations'}
  
  resources :line_items
  resources :carts
  resources :products
  resources :orders
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
 
  root "home#index"
end

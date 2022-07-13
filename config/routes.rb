Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
  registerable: 'users/registrations'} 


  # devise_scope :user do
  #   get 'users/registrations/check', :to => 'users/registrations#checkout', as: "checkout"
  # end
  #get "/check" => "users/registrations#checkout"


  get "/checkout", :to => "carts#checkout"
  put "/checkout", :to => "carts#confirm"
  patch "/checkout", :to => "carts#confirm"

  

  
  resources :line_items
  resources :carts
  resources :products
  #resources :orders
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
 
  root "home#index"
  #get 'users/registrations/checkout', to: 'registrations#checkout', as: checkout_user_registrations

  get "/register", :to => "devise/registrations#new"
end

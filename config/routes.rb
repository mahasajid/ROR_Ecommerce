Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
  registerable: 'users/registrations'} 
  resources :line_items
  resources :carts
  resources :products

  # devise_scope :user do
  #   get 'users/sessions/history', :to => 'users/sessions#history', as: "history"
  # end
  #get "/check" => "users/registrations#checkout"


  get "/checkout", :to => "carts#checkout"
  put "/checkout", :to => "carts#confirm"
  patch "/checkout", :to => "carts#confirm"

  get '/search' , to: 'search#search'

  

  #resources :orders
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
 
  root "home#index"
  #get 'users/registrations/checkout', to: 'registrations#checkout', as: checkout_user_registrations

  get "/register", :to => "devise/registrations#new"
end

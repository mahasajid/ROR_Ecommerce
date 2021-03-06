class ApplicationController < ActionController::Base

include CurrentCart
before_action :set_cart , :initialize_products
before_action :authenticate_user!
before_action :configure_permitted_parameters, if: :devise_controller?


    protected
    def initialize_products
      @products = Product.all
    end
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email, :name])
    end
end

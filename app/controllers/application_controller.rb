class ApplicationController < ActionController::Base

include CurrentCart
before_action :set_cart
#before_action :set_line_item
#before_action :authenticate_user!
before_action :configure_permitted_parameters, if: :devise_controller?
  
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email, :name])
    end
end

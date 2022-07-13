module ApplicationHelper

    def resource_name
        :user
      end
    
      def resource
        @resource ||= User.new
      end
    
      def devise_mapping
        @devise_mapping ||= Devise.mappings[:user]
      end


      def change_order_status (status)
        @cart.order_status = status

      end
end

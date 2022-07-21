module CurrentCart

    private


    def set_cart
        @cart = Cart.find(session[:cart_id])
        

        if @cart.order_status == "ordered"
        
            @cart =  Cart.create! #returns object with id:nil
            @cart.user = current_user
            session[:cart_id] = @cart.id

    end

    rescue ActiveRecord::RecordNotFound
        
        @cart = Cart.create!
        session[:cart_id] = @cart.id


    end

    # def set_cart
    #     if session[:cart_id]
    #       cart = Cart.find_by(:id => session[:cart_id])
    #       debugger
    #       if cart.present?
    #         @current_cart = cart
    #       else
    #         session[:cart_id] = nil
    #       end
    #     end
  
    #     if cart.order_status == "ordered" || session[:cart_id] == nil
            
    #       @current_cart = Cart.create
    #       session[:cart_id] = @current_cart.id
    #     end
    #   end
end

module CurrentCart

    private

    def set_cart
        @cart = Cart.find(session[:cart_id])
        

        if @cart.order_status != "pending"
        
            @cart =  Cart.create! #returns object with id:nil
            @cart.user = current_user
            session[:cart_id] = @cart.id

    end

    rescue ActiveRecord::RecordNotFound
        
        @cart = Cart.create!
        session[:cart_id] = @cart.id


    end

end

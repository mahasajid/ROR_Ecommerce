class CartsController < ApplicationController

#include CurrentCart
before_action :set_cart, only: %i[ show edit update destroy  confirm ]

  #before_action :set_line_item, only: %i[ checkout ]
  # GET /carts or /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1 or /carts/1.json
  def show
  end

  # GET /carts/new
   def new
  #@cart = Cart.new
  #@cart.user = current_user
  @cart = current_user.carts.build

    

    #@cart.current_user.build
  end

  # GET /carts/1/edit
  def edit
    @cart.user = current_user

  end

  # POST /carts or /carts.json
  def create

    @cart = current_user.cart.build(cart_params)
    @cart.user = current_user
    # @cart = Cart.new(cart_params)
    # @cart.save

    respond_to do |format|
      if @cart.save
        format.html { redirect_to cart_url(@cart), notice: "Cart was successfully created." }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
   
   #@user = current_user

   #params[:order_status] = "ordered"
   #@cart.order_status = "ordered"
   #current_user.cart.build(@cart_params)
   #changed_order_status("ordered")
  
    respond_to do |format|
      if @cart.update(cart_params)
        mail = UsersMailer.confirmation_email(current_user.id)

        #mail.deliver_now
        mail.deliver_later
        format.html { redirect_to products_path, notice: "Your order has been placed" }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart.destroy

    respond_to do |format|
      format.html { redirect_to products_path, notice: "Cart was successfully destroyed." }
      format.json { head :no_content }
    end
  end

#GET /checkout
  def checkout
    @cart.user = current_user
  end


#PUT /checkout
def confirm

  respond_to do |format|
    if @cart.update(cart_params)
      format.html { redirect_to products_path, notice: "Order was placed" }
      format.json { render :show, status: :ok, location: @cart }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @cart.errors, status: :unprocessable_entity }
    end
  end


end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      #params.fetch(:cart, {})

      params.require(:cart).permit( :user_id, :order_status,:shipping_address)
    end

    # def user_params
    #   params.require(:user).permit( :name , :shipping_address, :email )
    # end


   
end

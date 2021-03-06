class CartsController < ApplicationController

#include CurrentCart
before_action :set_cart, only: %i[ show edit update destroy  confirm ]
before_action :update_order_status, only: %i[update]
  # GET /carts or /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1 or /carts/1.json
  def show
  end

  # GET /carts/new
   def new
  @cart = current_user.carts.build
  end

  # GET /carts/1/edit
  def edit
    @cart.user = current_user

  end

  # POST /carts or /carts.json
  def create

    @cart = current_user.cart.build(cart_params)
    @cart.user = current_user
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
     respond_to do |format|
     if @cart.update(cart_params)
      if params[:order_status] == "ordered"
        mail = UsersMailer.confirmation_email(current_user.id)
        mail.deliver_later
        format.html { redirect_to products_path, notice: "Your order has been placed" }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { redirect_to carts_path, notice: "Your order has been cancelled" }
        format.json { render :show, status: :ok, location: @cart }
      end

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
  end


#PUT /checkout
def confirm

  respond_to do |format|
    if @cart.update(cart_params)

      format.html { redirect_to products_path, notice: "Your order was cancelled" }
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
      params.require(:cart).permit( :user_id, :order_status,:shipping_address, :billing_address)
    end


    def update_order_status
      if params[:order_status] == "pending"
        params[:order_status] = "ordered"
      else
        params[:order_status] = "cancelled"
      end
      
    end

   
end

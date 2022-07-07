class OrdersController < ApplicationController

    #before_action :set_order, only: %i[ show edit update destroy ]
    def index

    end

    def new

    end

    def create
    

    end

    def show
        @order = Order.all
        end
    
  end
  
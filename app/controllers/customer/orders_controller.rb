class Customer::OrdersController < ApplicationController

    def index       
        @orders = current_customer.orders
    end

    def show
        @order = Order.find(params[:id])
    end




end

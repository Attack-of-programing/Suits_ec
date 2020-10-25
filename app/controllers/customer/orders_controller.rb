class Customer::OrdersController < ApplicationController

    
    # ログイン中のユーザのみアクセス許可
    before_action :authenticate_customer!
    


    def index       
        @orders = current_customer.orders
    end

    def show
        @order = Order.find(params[:id])
    end


end

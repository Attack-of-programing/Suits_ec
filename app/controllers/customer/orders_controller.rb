class Customer::OrdersController < ApplicationController

  def new
    @order = Order.new

  end

  def confilm
    @order = Order.new(order_params)

  end

  private

  def order_params
    params.require(:order).permit(:pay_method)
  end

end

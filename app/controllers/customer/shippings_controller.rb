class Customer::ShippingsController < ApplicationController



  def index
    @shippings = Shipping.all
    @shipping = Shipping.new
    

  end

  def create
    @shipping = Shipping.new(shipping_params)
    if @shipping.save
     @customer_id = current_customer.id
      redirect_to shippings_path, notice: "You have created shipping data successfully."
    else
      @shippings = Shipping.all
      render "index"
    end
  end

  def destroy
     @shipping =Shipping.find(params[:id])
     @shipping.destroy
     redirect_to shippings_path
  end

  def edit
    @shipping =Shipping.find(params[:id])
  end

  def update
    @shipping =Shipping.find(params[:id])
    if @shipping.update(shipping_params)
      redirect_to shippings_path,notice: "You have updated shipping data successfully."
    else
      render "edit"
    end
  end

private

  def shipping_params
    params.require(:shipping).permit(:postcode,:address,:name).merge(customer_id: current_customer.id)
  end
end

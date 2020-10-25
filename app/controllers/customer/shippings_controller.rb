class Customer::ShippingsController < ApplicationController


  def index
    @shippings = Shipping.all
    @shipping = Shipping.new
    @shippings =current_customer.shippings
  end

  def create
    @shipping = Shipping.new(shipping_params)
    if @shipping.save
      redirect_to shippings_path, notice: "配送先情報を登録しました。"
    else
      @shippings = Shipping.all
      render "index"
    end
  end

  def destroy
     @shipping =Shipping.find(params[:id])
     @shipping.destroy
     redirect_to shippings_path, notice: "配送先情報を削除しました。"
  end

  def edit
    @shipping =Shipping.find(params[:id])
  end

  def update
    @shipping =Shipping.find(params[:id])
    if @shipping.update(shipping_params)
      redirect_to shippings_path,notice: "配送先情報を更新しました。"
    else
      render "edit"
    end
  end

private

  def shipping_params
    params.require(:shipping).permit(:postcode,:address,:name).merge(customer_id: current_customer.id)
  end


end

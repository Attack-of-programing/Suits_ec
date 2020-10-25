class Customer::OrdersController < ApplicationController

  def new
    # 表示用
    @customer = current_customer
    # 新規注文用の箱
    @order = Order.new(customer_id: @customer.id)
    # 自分のIDの配送先を全部とってくる
    @shippings = Shipping.where(customer_id: @customer.id)
  end

  def confirm
    # 新規注文用の箱
    @order = Order.new(order_params)
    # 表示用
    @customer = current_customer
    # カートの中身をインスタンス変数に入れる
    @items = @customer.cart_items
    # 商品合計の計算
    @total_price = 0
    @items.each do |cart_item|
      @total_price += cart_item.product.tax_included * cart_item.number
    end

    # shipping_addressの中身を入れる(3はフォームに直接情報入力する為不要)
    if params[:order][:shipping_address] == "0"
      @order.postcode = @customer.postcode
      @order.address = @customer.address
      @order.name = @customer.full_name
    elsif params[:order][:shipping_address] == "1"
      @shipping = Shipping.find_by(id: @order.shipping_id,customer_id: @customer.id)
      @order.postcode = @shipping.postcode
      @order.address = @shipping.address
      @order.name = @shipping.name
    end

  end

  def create
    @order = Order.new(order_params)
    @customer = current_customer
    @order.customer_id = @customer.id

    item = []
      # アイテムを取り出す
			@items = @customer.cart_items
			 # アイテムを一個ずつ取り出して注文商品カラムに当て嵌め
				@items.each do |i|
					item << @order.order_products.build(product_id: i.product_id, number: i.number, tax_price: i.product.tax_included, production_status: 0)
				end
		  #モデルにインポート
			OrderProduct.import item

    if @order.save
      redirect_to thanks_orders_path
    else
      render 'confirm'
    end
  end

  def thanks
    @customer = current_customer
    @items = @customer.cart_items
    @items.destroy_all
  end


  private

  def order_params
    params.require(:order).permit(:total_price, :name, :postcode, :address, :pay_method, :shipping_id )
  end

end

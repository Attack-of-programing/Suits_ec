class Customer::OrdersController < ApplicationController

  # ログイン中のユーザのみアクセス許可
  before_action :authenticate_customer!
    
  def index       
      @orders = current_customer.orders
  end

  def show
      @order = Order.find(params[:id])
  end

  
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


    if @order.save
      # アイテムを取り出す
			@items = @customer.cart_items
      @items.each do |cart_item|
      OrderProduct.create(
        product_id: cart_item.product_id,
        order_id: @order.id,
        number: cart_item.number,
        production_status: "着手不可",
        tax_price: cart_item.product.tax_included
      )
    end

      
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

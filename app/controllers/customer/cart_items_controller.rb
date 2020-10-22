class Customer::CartItemsController < ApplicationController
    
    def index
        @cart_items = current_customer.cart_items
        @total_price = 0
        @cart_items.each do |cart_item|
            @total_price += cart_item.product.tax_included * cart_item.number
        end
    end
    
    def create
        @cart_item = CartItem.new(cart_item_params)
        @cart_items = current_customer.cart_items
        @duplicate_cart_item = @cart_items.find_by(product: @cart_item.product)
        if @duplicate_cart_item.present?
            @duplicate_cart_item.number += @cart_item.number
            @duplicate_cart_item.save
        else
            @cart_item.save
        end
        redirect_to cart_items_path   
    end
    
    def update
        # IDに基づく商品を取得
        @cart_item = CartItem.find(params[:id])
        if @cart_item.update(cart_item_params)
            flash[:success] = "数量を変更しました"
            redirect_to cart_items_path
        else
            @cart_items = current_customer.cart_items
            render :index
        end
    end
    
    def destroy
        @cart_item = CartItem.find(params[:id])
        @cart_item.destroy
        redirect_to request.referer
    end
    
    def destroy_all
        @cart_items = current_customer.cart_items
        @cart_items.destroy_all
        redirect_to request.referer
    end
    
    private
    # ストロングパラメータ
    def cart_item_params
        params.require(:cart_item).permit(:customer_id, :product_id, :number)
    end
    
end

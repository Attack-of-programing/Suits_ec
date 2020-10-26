class Admin::OrderProductsController < ApplicationController
    
    # ログイン中の管理者のみアクセス許可
    before_action :authenticate_admin!
    
    def update
        # 指定の注文商品を取得
        @order_product = OrderProduct.find(params[:id])
        @order = @order_product.order
        @order_product.update(order_product_params)
        
        # 製作ステータスが「製作中」の注文商品が一つ以上の場合、注文ステータスを「製作中」にする
        making_products = OrderProduct.where(order_id: @order_product.order_id,production_status: "製作中")
        if (making_products.count >= 1)
            @order.update(order_status: "製作中")
        end
        
        # 注文商品全ての製作ステータスが「製作完了」になった場合、注文ステータスを「発送準備中」にする
        made_products = OrderProduct.where(order_id: @order_product.order_id,production_status: "製作完了")
        if (made_products.count == @order.order_products.count)
            @order.update(order_status: "発送準備中")
        end
        
        flash.now[:notice] = "製作ステータスを変更しました。"
        redirect_to admin_order_path(@order)
    end
    
    # ストロングパラメータ
    private
	def order_product_params
		  params.require(:order_product).permit(:production_status)
	end
    
end

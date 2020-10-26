class Admin::OrdersController < ApplicationController
    
    # ログイン中の管理者のみアクセス許可
    before_action :authenticate_admin!
    
    def index
        if params[:only_today_flag]
            now = Time.current
            # 本日の注文情報のみ取得
            @orders = Order.where(created_at: now.all_day).page(params[:page]).per(10)
            
        elsif params[:customer_id]
            # 指定のユーザーの注文情報のみ取得
            @orders = Order.where(customer_id: params[:customer_id]).page(params[:page]).per(10)
            
        else
            # 全注文情報を取得する
            @orders = Order.all.page(params[:page]).per(10)
        end
    end
    
    def show
        # 指定の注文を取得
        @order = Order.find(params[:id])
    end
    
    def update
        # 指定の注文を取得
        @order = Order.find(params[:id])
        if @order.update(order_params)
            
            # 注文ステータスが「入金確認」となった場合、注文商品の製作ステータスを全て「製作待ち」にする
            if (@order.order_status == "入金確認")
                @order.order_products.each do |order_product|
                    order_product.update(production_status: "製作待ち")
                end
            end
            
            flash.now[:notice] = "注文ステータスを変更しました。"
            redirect_to admin_order_path(@order)
        else
            render :show
        end
    end
    
    # ストロングパラメータ
    private
	def order_params
		  params.require(:order).permit(:order_status)
	end
    
end

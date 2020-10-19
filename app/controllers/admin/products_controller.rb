class Admin::ProductsController < ApplicationController
    
  def new
    @product = Product.new
    @genres = Genre.all
  end
  
  def create
    # 新規商品情報の取得
    @product = Product.new(product_params)
    # 新規商品情報の保存
    if @product.save
      flash[:notice] = "新商品を登録しました"
      redirect_to admin_product_path(@product)
    else
      # エラーが発生した場合
      render :new
    end
  end
  
  private
  # ストロングパラメータ
  def product_params
    params.require(:product).permit(:name, :image, :explanation,
       :genre_id, :after_tax_price, :is_sale)
  end  
  
end

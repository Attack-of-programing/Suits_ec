class Customer::ProductsController < ApplicationController
    
  def index
    # 有効ジャンルを全て取得
    @genres = Genre.where(is_active: true).all
    if params[:genre_id]
      # ジャンル検索の場合、ジャンルが有効であるかつ検索ジャンルに当てはまる商品を取得
      @products = Product.eager_load(:genre).where(genres: {is_active: true}, genre_id: params[:genre_id]).page(params[:page]).per(8)
      # 検索ジャンルの取得
      @genre = Genre.find(params[:genre_id])
    else
      # 商品全表示の場合、ジャンルが有効である商品を全て取得する
      @products = Product.eager_load(:genre).where(genres: {is_active: true}).all.page(params[:page]).per(8)
    end
  end
  
  private
  # ストロングパラメータ
  def product_params
    params.require(:product).permit(:name, :image, :explanation,
       :genre_id, :after_tax_price, :is_sale)
  end  
  
end

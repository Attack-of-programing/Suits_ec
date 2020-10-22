class Customer::ProductsController < ApplicationController
  
  # 商品情報が必要なメソッドは、先に指定IDの商品を取得していく。
  before_action :set_product, only: [:show]
    
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
  
  def show
    # 有効ジャンルを全て取得
    @genres = Genre.where(is_active: true).all
    # カート用の新規のインスタンス変数を定義
    @cart_item = CartItem.new
  end
  
  private
  # ストロングパラメータ
  def product_params
    params.require(:product).permit(:name, :image, :explanation,
       :genre_id, :after_tax_price, :is_sale)
  end
  
  # 指定IDの商品情報の取得
  def set_product
    # IDに基づく商品を取得
    @product = Product.find(params[:id])
  end
  
end

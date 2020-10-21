class Admin::ProductsController < ApplicationController
  
  # 商品情報が必要なメソッドは、先に指定IDの商品を取得していく。
  before_action :set_product, only: [:show, :edit, :update]
  # ジャンルの取得が必要なメソッドでは、先にジャンルを取得しておく
  before_action :set_genres, only: [:new, :edit, :index, :create, :update]
  
  def index
    # ジャンルが有効である商品を全て取得する。1ページ10個表示する。
    @products = Product.eager_load(:genre).where(genres: {is_active: true}).all.page(params[:page]).per(10)
  end
  
  def new
    # 新規商品用のインスタンス変数
    @product = Product.new
  end
  
  def show
  end
  
  def edit
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
  
  def update
    if @product.update(product_params)
      flash[:success] = "商品内容をを変更しました"
      redirect_to admin_product_path(@product)
    else
      render :edit
    end
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
  
  # 有効ジャンルの取得
  def set_genres
    @genres = Genre.where(is_active: true)
  end
  
end

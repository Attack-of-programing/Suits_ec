class Admin::SearchsController < ApplicationController
  
  # ログイン中の管理者のみアクセス許可
  before_action :authenticate_admin!
  
  def search
    # 検索対象のモデル："Customer","Product"
    @model = params["model"]
    # 検索ワード
    @content = params["content"]
    
    # @model、@contentを元に検索した結果をそれぞれのインスタンス変数に格納する
    if @model == "Customer"
      @customers = partical_customer(@content).page(params[:page]).per(10)
      if @customers.count == 0
        flash.now[:alert] = "該当する会員は見つかりませんでした。"
      end
      render "admin/customers/index"
    elsif @model == "Product"
      @products = partical_product(@content).page(params[:page]).per(10)
      if @products.count == 0
        flash.now[:alert] = "該当する商品は見つかりませんでした。"
      end
      render "admin/products/index"
    else
      @products = partical_genre(@content).page(params[:page]).per(10)
      if @products.count == 0
        flash.now[:alert] = "該当する商品は見つかりませんでした。"
      end
      render "admin/products/index"
    end
  end
    
  private
  # 会員検索
  def partical_customer(content)
      Customer.where("first_name LIKE ? or last_name LIKE ?", "%#{content}%","%#{content}%")
  end
  
  # 商品検索
  def partical_product(content)
      Product.where("name LIKE ?", "%#{content}%")
  end
  
  # ジャンル検索
  def partical_genre(content)
      Product.left_outer_joins(:genre).where("genres.name LIKE ?", "%#{content}%")
  end
  
end

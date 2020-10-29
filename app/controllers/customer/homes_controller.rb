class Customer::HomesController < ApplicationController

  def top
    # ジャンルが有効である商品の中からランダムで4つ取得する
    @products = Product.eager_load(:genre).where(genres: {is_active: true}).order("RANDOM()").limit(4)
    # 有効ジャンルを全て取得
    @genres = Genre.where(is_active: true).all
  end

  def about
  end
  
  
  
end

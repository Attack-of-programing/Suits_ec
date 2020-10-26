class Product < ApplicationRecord
  
  # 多重度の設定
  belongs_to :genre
  has_many :cart_items
  has_many :order_products
  
 
  # 画像を設定できるようにする
  attachment :image, destroy: false
  
  # バリデーションチェック
  # 空白時にエラー
  validates :name, :explanation, :genre_id, :after_tax_price, presence: true
  # 数値以外が入力された場合はエラー
  validates :after_tax_price, numericality: { only_integer: true }
  # is_saleの値がtrue,false以外の場合はエラー
  validates :is_sale, inclusion: [true, false]
  
  # 商品の税込価格の計算メソッド
  def tax_included
  	(after_tax_price * 1.1).round
  end
    
end

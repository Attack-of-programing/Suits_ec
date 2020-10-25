class Order < ApplicationRecord

    
    # 多重度の設定
    belongs_to :customer,dependent: :destroy
    has_many :order_products
    
    # 列挙型変数の定義
    enum pay_method: {"クレジットカード": 0,"銀行振込": 1}
	  enum order_status: {"入金待ち": 0,"入金確認": 1,"製作中": 2,"発送準備中": 3, "発送済み": 4}
    
end

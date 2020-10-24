class OrderProduct < ApplicationRecord
    
    # 多重度の設定
    belongs_to :order
	belongs_to :product
	
	# 列挙型変数の定義
	enum production_status: {"着手不可": 0,"製作待ち": 1,"製作中": 2,"製作完了": 3}
    
end

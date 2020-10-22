class Genre < ApplicationRecord
    
    # 多重度の設定
    has_many :products
    
    # バリデーションチェック
    # 空白時にエラー
    validates :name, presence: true

end

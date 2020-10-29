class CartItem < ApplicationRecord
    
    # 多重度の設定
    belongs_to :customer
    belongs_to :product
    
    # バリデーションチェック
    # 空白時、数値以外が入力された場合はエラー
    validates :number, presence: true, numericality: { only_integer: true }
    
end

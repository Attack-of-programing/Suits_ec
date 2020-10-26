class Order < ApplicationRecord

    #カラムとして存在しないものをメソッドとして定義する
    attr_accessor :shipping_id

    # バリデーション
    validates :postcode, presence: true, length: { is: 7 }, format: { with: /\A[0-9]+\z/ }
    validates :address, presence: true
    validates :name, presence: true  
  
    # 他モデルにもデータを登録したい場合
    # accepts_nested_attributes_for :order_products
    
    # 多重度の設定
    belongs_to :customer
    has_many :order_products, dependent: :destroy
    
    # 列挙型変数の定義
    enum pay_method: {"クレジットカード": 0,"銀行振込": 1}
    enum order_status: {"入金待ち": 0,"入金確認": 1,"製作中": 2,"発送準備中": 3, "発送済み": 4}
    
end

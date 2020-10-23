class Order < ApplicationRecord

  # 多重度紐付け
  belongs_to :customer
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_product

  # 支払方法
  enum pay_method: { credit: 0, bank: 1}

  # 郵便番号、住所、宛名合体表示

end

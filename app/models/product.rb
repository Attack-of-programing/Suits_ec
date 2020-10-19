class Product < ApplicationRecord
  
  belongs_to :cart_items
  belongs_to :orders
  has_many :genres, dependent: :destroy
  
end

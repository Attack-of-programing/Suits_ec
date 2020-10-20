class Shipping < ApplicationRecord
 
  belongs_to :customers
 
  validates :postcode, presence: true
	validates :address, presence: true
  validates :name, presence: true
end

class Shipping < ApplicationRecord

  belongs_to :customer

  validates :postcode, presence: true, length: { is: 7 }, format: { with: /\A[0-9]+\z/ }
	validates :address, presence: true
  validates :name, presence: true

  def full_address
    self.postcode + " " + self.address +  " " + self.name
  end

end

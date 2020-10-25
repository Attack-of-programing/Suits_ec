class OrderProduct < ApplicationRecord
  belongs_to:order
  belongs_to:product

def subtotal_price
   tax_price * number
end

end

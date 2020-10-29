class ChangeIsSaleDefaultOnProduct < ActiveRecord::Migration[5.2]
  def change
    change_column_default :products, :is_sale, from: true, to: nil
  end
end

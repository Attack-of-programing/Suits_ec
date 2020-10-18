class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|

      t.timestamps
      t.integer :product_id, null: false
      t.integer :customer_id, null: false
      t.integer :number, null: false
    end
  end
end

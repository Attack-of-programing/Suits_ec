class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.timestamps
      t.integer :customer_id, null: false
      t.integer :total_price, null: false
      t.string :name, null: false
      t.string :postcode, null: false
      t.text :address, null: false
      t.integer :pay_method, null: false
      t.integer :order_status, null: false, default: 0
      t.integer :postage, null: false, default: 800

    end
  end
end

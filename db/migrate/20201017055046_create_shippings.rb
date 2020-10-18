class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|

      t.timestamps
      t.integer :customer_id, null: false
      t.string :name, null: false
      t.string :postcode, null: false
      t.text :address, null: false
    end


  end
end

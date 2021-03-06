class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

      t.timestamps
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.text :explanation, null: false
      t.integer :after_tax_price, null: false
      t.boolean :is_sale, null: false, default: true
      t.string :image_id, null: false

    end
  end
end

class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :sub_category
      t.string :brand
      t.string :characteristics
      t.string :quantity_left
      t.string :condition
      t.string :buying_date
      t.string :expiration_date
      t.integer :price
      t.string :barcode
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

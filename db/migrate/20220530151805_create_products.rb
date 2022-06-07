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
      t.date :buying_date
      t.date :expiration_date
      t.float :price
      t.string :barcode
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

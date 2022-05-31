class AddSubCategoeryToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :sub_category, null: false, foreign_key: true
  end
end

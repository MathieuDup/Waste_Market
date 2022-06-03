class AddEanToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :EAN, :string
  end
end

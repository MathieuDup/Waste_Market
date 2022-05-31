class RemoveCategoryFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :category, :string
    remove_column :products, :sub_category, :string
  end
end

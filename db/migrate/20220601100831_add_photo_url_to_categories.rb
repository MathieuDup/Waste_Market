class AddPhotoUrlToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :photo_url, :string
  end
end

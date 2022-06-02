class Category < ApplicationRecord
  has_many :sub_categories, dependent: :destroy
  has_many :products, class_name: "Product"

  include PgSearch::Model
  multisearchable against: [:name]
end

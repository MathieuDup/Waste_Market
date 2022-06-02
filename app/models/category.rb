class Category < ApplicationRecord
  has_many :sub_categories
  has_many :products, class_name: "Product"

  include PgSearch::Model
  multisearchable against: [:name]
end

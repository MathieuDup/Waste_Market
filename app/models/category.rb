class Category < ApplicationRecord
  has_many :sub_categories
  has_many :products, class_name: "Product"
end

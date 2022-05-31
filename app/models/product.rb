class Product < ApplicationRecord
  belongs_to :user
  has_many :orders
  belongs_to :category, class_name: "Category"
  belongs_to :sub_category, class_name: "SubCategory"
  has_one_attached :photo
  # validates :name, presence: true
  # validates :price, presence: true
  # validates :category, presence: true
  # validates :sub_category, presence: true
  # validates :condition, presence: true
  # validates :quantity_left, presence: true
end

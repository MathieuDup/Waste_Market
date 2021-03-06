class Product < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  belongs_to :category, class_name: "Category"
  belongs_to :sub_category, class_name: "SubCategory"
  has_one_attached :photo
  # validates :name, presence: true
  # validates :price, presence: true
  # validates :category, presence: true
  # validates :sub_category, presence: true
  # validates :condition, presence: true
  # validates :quantity_left, presence: true
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :brand, :condition, :characteristics, :description ],
    associated_against: {
      category: :name,
      sub_category: :name
    },
    using: {
      tsearch: { prefix: true }
    }

  def user_bookmark(user)
    bookmarks.find_by(user: user)
  end
end

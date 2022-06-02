class SubCategory < ApplicationRecord
  belongs_to :category
  # multisearchable against: [:name]
end

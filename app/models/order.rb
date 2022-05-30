class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :messages
end

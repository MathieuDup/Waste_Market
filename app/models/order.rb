class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :messages
  has_many :reviews

  def reviews_from_others(user)
    reviews.where.not(user_id: user.id)
  end
end

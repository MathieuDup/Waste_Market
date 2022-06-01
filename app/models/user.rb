class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products, dependent: :destroy
  has_many :orders_as_owner, through: :products, source: :orders
  has_many :orders
  has_many :bookmarks
  has_many :messages
  # validates :username, presence: true, uniqueness: true
  # validates :address, presence: true

  has_one_attached :photo

  def my_reviews
    (orders.map(&:reviews) + orders_as_owner.map(&:reviews)).flatten
  end

  def can_order?(id)
    products.each { |product| can_order = false if product.id == id }
    if !orders.where(product_id: id).empty? && self.orders.where(product_id: id).select { |order| order.progress == "Cancelled" }.empty?
      can_order = false
    else
      can_order = true
    end
    can_order
  end
end

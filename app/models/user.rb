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

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def my_reviews
    (orders.map(&:reviews) + orders_as_owner.map(&:reviews)).flatten
  end

  def not_my_product?(product)
    product.user_id != id
  end

  def not_already_ordered?(product)
    orders.find { |order| order.product_id == product.id }.nil?
  end

  def my_order_status(product)
    orders.where(product_id: product.id).select { |order| order.progress == "Cancelled" }.empty?
  end

  def can_order?(product)
    not_my_product?(product) && not_already_ordered?(product) && my_order_status(product)
  end

  def can_contact?(product)
    product.user_id != id
    # if product.user.id == id
    #   can_contact = false
    # else
    #   can_contact = true
    # end
    # can_contact
  end

  def can_review?(order)
    order.reviews.find_by(user_id: id) ? false : true
  end
end

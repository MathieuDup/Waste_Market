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
    # can_order = false if user is owner of product or product is already in cart
    # je peux acheter le produit seulement si :
      # j'en suis pas propriétaire
    not_my_product?(product) && not_already_ordered?(product) && my_order_status(product)
      # si je n'ai pas déjà fais une order dessus

      # si le status de l'order est cancel
    # if product.user_id == id
    #   can_order = false
    # else
    #   can_order = true
    # end
    # if !orders.where(product_id: id).empty? && self.orders.where(product_id: id).select { |order| order.progress == "Cancelled" }.empty?
    #   can_order = false
    # else
    #   can_order = true
    # end
    # can_order
  end

  def can_contact?(product)
    if product.user.id == id
      can_contact = false
    else
      can_contact = true
    end
    can_contact
  end
end

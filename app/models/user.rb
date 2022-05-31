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

  def my_reviews
    (orders.map(&:reviews) + orders_as_owner.map(&:reviews)).flatten
  end

  # validates :username, presence: true, uniqueness: true
  # validates :address, presence: true
end

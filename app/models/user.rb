class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_many :orders_as_owner, through: :products, source: :orders
  has_many :products
  has_many :bookmarks
  has_many :messages
  validates :username, presence: true, uniqueness: true
  validates :address, presence: true
end

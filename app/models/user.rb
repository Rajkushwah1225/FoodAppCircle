class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :cart
  has_many :orders
  after_create :set_cart

  private

  def set_cart
    Cart.create(user_id: self.id)
  end
end

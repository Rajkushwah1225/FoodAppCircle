class Cart < ApplicationRecord
    #has_many :cuisines 
    belongs_to :user
    has_many :fooditems
    #has_many :orders
    has_many :cartitems
    validates :user_id, presence: true
end

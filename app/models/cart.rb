class Cart < ApplicationRecord
    has_many :cuisines 
    belongs_to :user
    has_many :orders
end

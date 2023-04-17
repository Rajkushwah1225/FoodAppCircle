class Cuisine < ApplicationRecord
    belongs_to :restaurant
    belongs_to :cart
    validates :name, presence: true
end

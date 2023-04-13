class Cuisine < ApplicationRecord
    belongs_to :restaurant
    has_many :fooditems
    validates :name, presence: true
    # validates :name, uniqueness: { scope: :restaurant_id }
end

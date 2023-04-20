class Fooditem < ApplicationRecord
   belongs_to :restaurant
   belongs_to :cart
end

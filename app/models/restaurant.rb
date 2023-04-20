class Restaurant < ApplicationRecord
    has_many  :cuisines,  dependent: :destroy
    has_many  :fooditems
    validates :name, :address, presence: true
    validates :name, uniqueness: true
end

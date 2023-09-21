class Restaurant < ApplicationRecord
    has_many  :cuisines,  dependent: :destroy
    has_many  :fooditems
    validates :name, :address, presence: true
    validates :name, uniqueness: true
    has_one_attached :image
end

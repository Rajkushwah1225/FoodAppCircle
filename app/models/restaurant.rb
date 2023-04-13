class Restaurant < ApplicationRecord
    has_many :cuisines, dependent: :destroy
    has_many :fooditems, through: :cuisines
    validates :name, :address, presence: true
    validates :name, uniqueness: true
end

class Restaurant < ApplicationRecord
    #  has_many :cuisines, dependent: :destroy
    validates :name, :address, presence: true
    validates :name, uniqueness: true
end

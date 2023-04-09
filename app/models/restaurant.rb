class Restaurant < ApplicationRecord
    belongs_to :city
    validates :city_id, :name, presence: true
end

class Order < ApplicationRecord
    belongs_to :cart
    belongs_to :user
    enum status: [:Pending, :Confirmed, :Rejected, :Cancelled]
end

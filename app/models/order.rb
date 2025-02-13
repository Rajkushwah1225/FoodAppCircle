class Order < ApplicationRecord
  belongs_to :user
  enum status: %i[Pending Confirmed Rejected Cancelled]
  serialize :fooditem_ids, Array
end

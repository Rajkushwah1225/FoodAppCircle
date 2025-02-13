class Cartitem < ApplicationRecord
  belongs_to :fooditem
  belongs_to :cart
  enum status: %i[quantity cancelled]
end

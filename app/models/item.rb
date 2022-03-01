class Item < ApplicationRecord
  belongs_to :product
  belongs_to :vending_machine
end

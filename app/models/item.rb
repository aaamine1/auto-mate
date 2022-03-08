class Item < ApplicationRecord
  belongs_to :product
  belongs_to :vending_machine

  before_save :default_item_quantity

  def default_item_quantity
    self.quantity ||= 0
  end
end

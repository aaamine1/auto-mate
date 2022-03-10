class Item < ApplicationRecord
  belongs_to :product
  belongs_to :vending_machine

  before_save :default_item_quantity

  validates :product, presence: true
  validates :list_price, presence: true
  validates :margin, presence: true
  validates :capacity, presence: true

  def default_item_quantity
    self.quantity ||= 0
  end
end

class Product < ApplicationRecord
  has_many :items
  has_many :vending_machines, through: :items
end

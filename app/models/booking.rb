class Booking < ApplicationRecord
  belongs_to :vending_machine
  belongs_to :user
end

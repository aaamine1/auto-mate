class VendingMachine < ApplicationRecord
  belongs_to :user
  has_many :items

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

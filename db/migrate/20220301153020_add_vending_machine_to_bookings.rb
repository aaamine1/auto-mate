class AddVendingMachineToBookings < ActiveRecord::Migration[6.1]
  def change
    add_reference :bookings, :vending_machine, null: false, foreign_key: true
  end
end

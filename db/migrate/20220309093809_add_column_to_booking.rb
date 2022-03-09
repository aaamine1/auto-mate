class AddColumnToBooking < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :date_completed, :date, default: Date.new(2022,1,4)
  end
end

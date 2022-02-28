class AddUserRefToVendingMachines < ActiveRecord::Migration[6.1]
  def change
    add_reference :vending_machines, :user, null: false, foreign_key: true
  end
end

class ChangeTypesToVendingMachines < ActiveRecord::Migration[6.1]
  def change
    change_column :vending_machines, :longitude, :float
    change_column :vending_machines, :latitude, :float
  end
end

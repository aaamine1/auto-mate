class AddNameToVendingMachines < ActiveRecord::Migration[6.1]
  def change
    add_column :vending_machines, :name, :string 
  end
end

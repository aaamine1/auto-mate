class AddDescriptionToVendingMachines < ActiveRecord::Migration[6.1]
  def change
    add_column :vending_machines, :description, :text
  end
end

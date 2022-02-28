class AddVendingMachineRefToItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :items, :vending_machine, null: false, foreign_key: true
  end
end

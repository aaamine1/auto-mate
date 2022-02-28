class CreateVendingMachines < ActiveRecord::Migration[6.1]
  def change
    create_table :vending_machines do |t|
      t.string :address
      t.integer :longitude
      t.integer :latitude

      t.timestamps
    end
  end
end

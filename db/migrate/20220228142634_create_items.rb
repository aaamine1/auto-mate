class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :list_price
      t.integer :margin
      t.integer :capacity
      t.integer :quantity

      t.timestamps
    end
  end
end

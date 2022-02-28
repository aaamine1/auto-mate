class AddItemRefToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :item, null: false, foreign_key: true
  end
end

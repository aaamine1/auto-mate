class RemoveReferenceToProducts < ActiveRecord::Migration[6.1]
  def change
    remove_reference :products, :item
  end
end

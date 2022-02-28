class AddIbanToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :iban, :string
  end
end

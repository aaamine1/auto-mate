class ChangeColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :avatar_url, "default_avatafr.jpg"
  end
end

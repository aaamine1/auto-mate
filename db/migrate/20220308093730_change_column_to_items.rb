class ChangeColumnToItems < ActiveRecord::Migration[6.1]
  def change
    change_column_default :items, :quantity, default: 0
    change_column_default :users, :avatar_url, "default_avatar.jpg"
  end
end

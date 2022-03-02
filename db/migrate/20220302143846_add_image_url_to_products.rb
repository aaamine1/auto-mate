class AddImageUrlToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :image_url, :string, default: "https://lorempixel.com/730/411"
    add_column :users, :avatar_url, :string, default: "default_avater.jpg"
  end
end

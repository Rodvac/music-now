class AddPriceuserToJamsUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :jams_users, :priceuser, :float
  end
end

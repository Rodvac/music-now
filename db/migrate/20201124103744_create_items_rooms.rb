class CreateItemsRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :items_rooms do |t|
      t.references :item, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end

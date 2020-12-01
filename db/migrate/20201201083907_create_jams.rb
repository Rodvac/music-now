class CreateJams < ActiveRecord::Migration[6.0]
  def change
    create_table :jams do |t|
      t.string :name
      t.references :room, foreign_key: true
      t.references :booking, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end

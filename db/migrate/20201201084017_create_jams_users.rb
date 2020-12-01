class CreateJamsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :jams_users do |t|
      t.references :jam, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

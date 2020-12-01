class AddInstrumentToJamsUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :jams_users, :instrument, :string
  end
end

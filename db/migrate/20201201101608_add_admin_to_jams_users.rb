class AddAdminToJamsUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :jams_users, :admin, :boolean
  end
end

class AddGroupeToJams < ActiveRecord::Migration[6.0]
  def change
    add_column :jams, :groupe, :boolean
  end
end

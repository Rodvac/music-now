class AddTimeDateToJams < ActiveRecord::Migration[6.0]
  def change
    add_column :jams, :date, :string
    add_column :jams, :time, :string
  end
end

class RemoveChatrooms < ActiveRecord::Migration[6.0]
  def change
    remove_reference :messages, :chatroom
    add_reference :messages, :booking
    drop_table :chatrooms
  end
end

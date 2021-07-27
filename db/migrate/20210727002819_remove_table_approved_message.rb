class RemoveTableApprovedMessage < ActiveRecord::Migration[5.2]
  def change
    drop_table :room_message_to_approves
  end
end

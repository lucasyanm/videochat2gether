class CreateRoomMessageToApproves < ActiveRecord::Migration[5.2]
  def change
    create_table :room_message_to_approves do |t|
      t.references :room, foreign_key: true
      t.string :user
      t.text :message

      t.timestamps
    end
  end
end

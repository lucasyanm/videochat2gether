class AddColumnToPutMessagePendingToApprove < ActiveRecord::Migration[5.2]
  def change
    add_column :room_messages, :pending_to_approve, :boolean, default: true, null: false
  end
end

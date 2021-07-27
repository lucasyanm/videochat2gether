class AddColumnToApproveMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :room_messages, :approved, :boolean, default: false, null: false
  end
end

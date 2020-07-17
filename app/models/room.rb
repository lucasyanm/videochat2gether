class Room < ApplicationRecord
  has_many :room_message_to_approve, dependent: :destroy
  has_many :room_messages, dependent: :destroy
end

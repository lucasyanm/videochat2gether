class Room < ApplicationRecord
  validates_uniqueness_of :name
  has_many :room_message_to_approve, dependent: :destroy
  has_many :room_messages, dependent: :destroy
end

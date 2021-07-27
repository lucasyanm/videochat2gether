class Room < ApplicationRecord
  validates_uniqueness_of :name
  has_many :room_messages, dependent: :destroy
end

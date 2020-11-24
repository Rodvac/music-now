class Room < ApplicationRecord
  has_many :bookings, :dependent => :destroy
  has_many :items_rooms
  has_many :items, through: :items_rooms
  has_many :reviews, through: :bookings
  belongs_to :studio
end

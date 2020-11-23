class Room < ApplicationRecord
  has_many :bookings
  has_many :items
  has_many :reviews, through: :bookings
  belongs_to :studio
end

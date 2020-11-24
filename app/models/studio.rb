class Studio < ApplicationRecord
  has_many :rooms, :dependent => :destroy
  has_many :bookings, through: :rooms
  has_many :reviews, through: :bookings
end

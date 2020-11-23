class Studio < ApplicationRecord
  has_many :rooms
  belongs_to :user
  has_many :bookings, through: :rooms
  has_many :items, through: :rooms
end

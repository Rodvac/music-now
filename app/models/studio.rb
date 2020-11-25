class Studio < ApplicationRecord
  has_many :rooms, :dependent => :destroy
  has_many :bookings, through: :rooms
  has_many :reviews, through: :bookings
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

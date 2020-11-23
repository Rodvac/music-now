class Booking < ApplicationRecord
  has_one :review
  belongs_to :user
  belongs_to :room
end

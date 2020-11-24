class Booking < ApplicationRecord
  has_one :review, :dependent => :destroy
  belongs_to :user
  belongs_to :room
end

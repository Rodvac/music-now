class Booking < ApplicationRecord
  has_one :review, :dependent => :destroy
  belongs_to :jam, optional: true
  belongs_to :user
  belongs_to :room

  validates :date, presence: true
  validates :time, presence: true
end

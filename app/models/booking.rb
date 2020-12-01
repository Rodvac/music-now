class Booking < ApplicationRecord
  has_one :review, :dependent => :destroy
  belongs_to :user
  belongs_to :room
  has_many :messages, :dependent => :destroy
  validates :date, presence: true
  validates :time, presence: true

  def formatted_date
    Date.strptime(date, "%Y-%d-%m")
  end
end

class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :user

  validates :title, presence: true
  validates :rating, presence: true
end

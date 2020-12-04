class Jam < ApplicationRecord
  belongs_to :room, optional: true
  belongs_to :booking, optional: true
  has_many :users, through: :jams_users
  has_many :jams_users, dependent: :destroy
  has_one_attached :photo
  accepts_nested_attributes_for :jams_users
end

class Item < ApplicationRecord
  has_many :rooms, through: :items_rooms
  has_one_attached :photo
end

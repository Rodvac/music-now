class Item < ApplicationRecord
  has_many :rooms, through: :items_rooms
end

class JamsUser < ApplicationRecord
  belongs_to :jam
  belongs_to :user
end

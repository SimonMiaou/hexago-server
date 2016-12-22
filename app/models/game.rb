class Game < ApplicationRecord
  has_many :hexagons
  has_and_belongs_to_many :users
end

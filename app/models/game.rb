class Game < ApplicationRecord
  has_many :hexagons
  has_many_and_belongs_to :users
end

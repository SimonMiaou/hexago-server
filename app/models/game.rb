class Game < ApplicationRecord
  has_many :hexagons
  has_many :games_users
  has_many :users, through: :games_users
end

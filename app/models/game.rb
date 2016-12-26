class Game < ApplicationRecord
  has_many :hexagons
  has_many :games_users
  has_many :users, through: :games_users

  validates :number_of_players, presence: true
  validates :board_size, numericality: { greater_than_or_equal_to: 3 },
                         presence: true
end

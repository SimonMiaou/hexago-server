class Game < ApplicationRecord
  has_many :hexagons
  has_many :games_users
  has_many :users, through: :games_users

  validates :board_size, numericality: { greater_than_or_equal_to: 3 },
                         presence: true
  validates :number_of_players, numericality: { greater_than_or_equal_to: 2,
                                                less_than_or_equal_to: 6 },
                                presence: true
end

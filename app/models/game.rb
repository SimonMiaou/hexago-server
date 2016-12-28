class Game < ApplicationRecord
  has_many :hexagons
  has_many :games_users
  has_many :users, through: :games_users

  validates :board_size, numericality: { greater_than_or_equal_to: 3 },
                         presence: true
  validates :number_of_players, numericality: { greater_than_or_equal_to: 2,
                                                less_than_or_equal_to: 6 },
                                presence: true

  after_create :create_hexagons

  private

  def create_hexagons
    min = board_size * -1
    max = board_size

    (min..max).each do |x|
      (min..max).each do |y|
        hexagons.create(x: x, y: y)
      end
    end

    hexagons.reset
  end
end

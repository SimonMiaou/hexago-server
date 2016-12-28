require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test 'Create automatically the hexagons' do
    game = create(:game, board_size: 3, hexagons: [])

    expected_coordinates = [
      [-3, 0, 3], [-3, 1, 2], [-3, 2, 1], [-3, 3, 0], [-2, -1, 3],
      [-2, 0, 2], [-2, 1, 1], [-2, 2, 0], [-2, 3, -1], [-1, -2, 3],
      [-1, -1, 2], [-1, 0, 1], [-1, 1, 0], [-1, 2, -1], [-1, 3, -2],
      [0, -3, 3], [0, -2, 2], [0, -1, 1], [0, 0, 0], [0, 1, -1],
      [0, 2, -2], [0, 3, -3], [1, -3, 2], [1, -2, 1], [1, -1, 0],
      [1, 0, -1], [1, 1, -2], [1, 2, -3], [2, -3, 1], [2, -2, 0],
      [2, -1, -1], [2, 0, -2], [2, 1, -3], [3, -3, 0], [3, -2, -1],
      [3, -1, -2], [3, 0, -3]
    ]

    assert_equal 37, game.hexagons.size
    assert_equal expected_coordinates, game.hexagons.map { |h| [h.x, h.y, h.z] }
  end
end

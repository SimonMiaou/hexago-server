require 'test_helper'

class HexagonTest < ActiveSupport::TestCase
  test 'validate coordinates' do
    assert build(:hexagon, x: 0, y: 0, z: 0).valid?
    refute build(:hexagon, x: 0, y: 1, z: 0).valid?
  end

  test 'validate uniqueness of a hexagon in a game' do
    game = create(:game)
    game.hexagons.destroy_all

    assert build(:hexagon, game: game, x: 0, y: 0).save

    refute build(:hexagon, game: game, x: 0, y: 0).save

    assert build(:hexagon, x: 0, y: 0).save

    assert build(:hexagon, game: game, x: 0, y: 1).save

    assert build(:hexagon, game: game, x: 1, y: 0).save
  end
end

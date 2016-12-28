require 'test_helper'

class HexagonTest < ActiveSupport::TestCase
  test 'validate coordinates' do
    assert Hexagon.new(x: 0, y: 0, z: 0, game: Game.new).valid?
    refute Hexagon.new(x: 0, y: 1, z: 0, game: Game.new).valid?
  end

  test 'validate uniqueness of a hexagon in a game' do
    game = create(:game)
    game.hexagons.destroy_all

    game_bis = create(:game)
    game_bis.hexagons.destroy_all

    assert build(:hexagon, game: game, x: 0, y: 0).save
    refute build(:hexagon, game: game, x: 0, y: 0).save

    assert build(:hexagon, game: game_bis, x: 0, y: 0).save

    assert build(:hexagon, game: game, x: 0, y: 1).save
    assert build(:hexagon, game: game, x: 1, y: 0).save
  end

  test 'validate distance with the center is less than or equal to the game board size' do
    game = create(:game, board_size: 3)
    game.hexagons.destroy_all

    assert build(:hexagon, game: game, x: 0, y: 3).save
    refute build(:hexagon, game: game, x: 0, y: 4).save
  end
end

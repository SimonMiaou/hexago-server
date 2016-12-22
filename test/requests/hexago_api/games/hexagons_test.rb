require 'test_helper'

class HexagoAPI
  module Games
    class HexagonsTest < ActionDispatch::IntegrationTest
      test 'Fetch hexagons of a game' do
        game = create(:game)
        hexagons = Array.new(5) { create(:hexagon, game: game) }

        get "/games/#{game.id}/hexagons"
        assert_response :success

        json = JSON.parse(response.body)
        assert_equal hexagons.map(&:id), json['hexagons'].map { |h| h['id'] }
      end
    end
  end
end

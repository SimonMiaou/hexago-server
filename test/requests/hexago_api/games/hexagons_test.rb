require 'test_helper'

class HexagoAPI
  module Games
    class HexagonsTest < ActionDispatch::IntegrationTest
      test 'Fetch hexagons of a game' do
        game = create(:game)

        get "/games/#{game.id}/hexagons"
        assert_response :success

        json = JSON.parse(response.body)
        assert_equal game.hexagon_ids, json['hexagons'].map { |h| h['id'] }
      end
    end
  end
end

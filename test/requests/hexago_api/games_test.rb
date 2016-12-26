require 'test_helper'

class HexagoAPI
  class GamesTest < ActionDispatch::IntegrationTest
    test 'Fetch a game' do
      game = create(:game)

      get "/games/#{game.id}"
      assert_response :success

      json = JSON.parse(response.body)
      assert_equal game.id, json['game']['id']
      assert_equal game.number_of_players, json['game']['number_of_players']
      assert_equal game.size, json['game']['size']
    end
  end
end

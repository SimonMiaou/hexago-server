require 'test_helper'

class HexagoAPI
  class GameTest < ActionDispatch::IntegrationTest
    test 'Fetch a game' do
      game = create(:game)
      get "/games/#{game.id}"
      assert_response :success

      json = JSON.parse(response.body)
      assert_equal game.id, json['game']['id']
    end
  end
end

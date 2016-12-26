require 'test_helper'

class HexagoAPI
  class GamesTest < ActionDispatch::IntegrationTest
    test 'Create a game' do
      number_of_players = rand(5) + 2
      size = rand(10) + 1
      payload = {
        game: {
          number_of_players: number_of_players,
          size: size
        }
      }

      post '/games', params: payload
      assert_response :created

      json = JSON.parse(response.body)
      assert_equal number_of_players, json['game']['number_of_players']
      assert_equal size, json['game']['size']
    end

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

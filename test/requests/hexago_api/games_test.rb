require 'test_helper'

class HexagoAPI
  class GamesTest < ActionDispatch::IntegrationTest
    test 'Create a game' do
      board_size = rand(8) + 3
      number_of_players = rand(5) + 2
      payload = {
        game: {
          board_size: board_size,
          number_of_players: number_of_players
        }
      }

      post '/games', params: payload
      assert_response :created

      json = JSON.parse(response.body)
      assert_equal board_size, json['game']['board_size']
      assert_equal number_of_players, json['game']['number_of_players']
    end

    test 'Fetch a game' do
      game = create(:game)

      get "/games/#{game.id}"
      assert_response :success

      json = JSON.parse(response.body)
      assert_equal game.id, json['game']['id']
      assert_equal game.number_of_players, json['game']['number_of_players']
      assert_equal game.board_size, json['game']['board_size']
    end
  end
end

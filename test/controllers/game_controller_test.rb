require 'test_helper'

class GameControllerTest < ActionDispatch::IntegrationTest
  test 'get game\'s informations' do
    game = create(:game)
    get game_url(game)
    assert_response :success
  end
end

class HexagoAPI
  module Entities
    class Game < Grape::Entity
      root 'games', 'game'

      expose :id
      expose :size
      expose :number_of_players
    end
  end
end

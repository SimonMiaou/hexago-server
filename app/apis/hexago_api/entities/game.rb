class HexagoAPI
  module Entities
    class Game < Grape::Entity
      root 'games', 'game'

      expose :id
    end
  end
end

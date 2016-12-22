class HexagoAPI
  module Entities
    class GameEntity < Grape::Entity
      root 'games', 'game'

      expose :id
    end
  end
end

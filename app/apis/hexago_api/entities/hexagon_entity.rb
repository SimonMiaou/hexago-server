class HexagoAPI
  module Entities
    class HexagonEntity < Grape::Entity
      root 'hexagons', 'hexagon'

      expose :id
      expose :x, :y, :z
    end
  end
end

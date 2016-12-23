class HexagoAPI
  module Entities
    class Hexagon < Grape::Entity
      root 'hexagons', 'hexagon'

      expose :id
      expose :x, :y, :z
    end
  end
end

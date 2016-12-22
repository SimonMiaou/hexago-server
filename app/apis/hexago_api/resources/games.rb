class HexagoAPI
  module Resources
    class Games < Grape::API
      resource :games do
        route_param :game_id do
          before do
            @game = Game.find params[:game_id]
          end

          desc 'Fetch a game'
          get do
            present @game, with: Entities::GameEntity
          end

          resource :hexagons do
            desc 'Fetch hexagons of a game'
            get do
              present @game.hexagons, with: Entities::HexagonEntity
            end
          end
        end
      end
    end
  end
end

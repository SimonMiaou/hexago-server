class HexagoAPI
  module Resources
    class Games < Grape::API
      resource :games do
        desc 'Create a new game', entity: Entities::Game
        params do
          requires :game, type: Hash do
            requires :board_size, type: Integer
            requires :number_of_players, type: Integer
          end
        end
        post do
          game = Game.create(params[:game].to_h)
          present game, with: Entities::Game
        end

        route_param :game_id do
          before do
            @game = Game.find params[:game_id]
          end

          desc 'Fetch a game', entity: Entities::Game
          get do
            present @game, with: Entities::Game
          end

          resource :hexagons do
            desc 'Fetch hexagons of a game', entity: Entities::Hexagon
            get do
              present @game.hexagons, with: Entities::Hexagon
            end
          end
        end
      end
    end
  end
end

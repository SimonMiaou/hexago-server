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
        end
      end
    end
  end
end

class HexagoAPI < Grape::API
  version 'v1', using: :header, vendor: 'HexaGo'
  format :json

  resource :games do
    route_param :game_id do
      before do
        @game = Game.find params[:game_id]
      end

      desc 'Fetch a game'
      get do
        { id: @game.id }
        present @game, with: Entities::GameEntity
      end
    end
  end
end

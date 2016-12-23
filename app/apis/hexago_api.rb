class HexagoAPI < Grape::API
  version 'v1', using: :header, vendor: 'HexaGo'
  format :json

  mount Resources::Games

  add_swagger_documentation
end

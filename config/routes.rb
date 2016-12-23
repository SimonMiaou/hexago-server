Rails.application.routes.draw do
  mount HexagoAPI => '/'
  mount GrapeSwaggerRails::Engine => '/swagger'
end

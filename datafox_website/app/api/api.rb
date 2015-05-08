class API < Grape::API
  prefix 'api'
  format :json
  mount Raw::Ping
  mount Raw::V1
end
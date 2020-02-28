require 'rack/cors'
require_relative 'api/app'


puts HuntersLodge::Api.routes.map { |i| i.path  }

use Rack::Cors do
  allow do

    origins '*'

    resource '*',
             headers: :any,
             methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end

run HuntersLodge::Api


# Rack::Handler.default.run(HuntersLodge::Api, :Port => 8080)


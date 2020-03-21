# frozen_string_literal: true

require 'rack/cors'
require_relative 'src/api/app'


puts HuntersLodge::Api.routes.map(&:path)

use Rack::Cors do
  allow do

    origins '*'

    resource '*',
             headers: :any,
             methods: %i[get post put patch delete options head]
  end
end

run HuntersLodge::Api


# Rack::Handler.default.run(HuntersLodge::Api, :Port => 8080)


require 'serverless_rack'
require_relative 'api/app'

$app ||= HuntersLodge::API.new

def handler(event:, context:)
  handle_request(app: $app, event: event, context: context)
end

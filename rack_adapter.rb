# frozen_string_literal: true

require 'serverless_rack'
require_relative 'src/api/rack_app'

schema_name = 'user'.downcase
schema_path = File.join(__dir__, 'src/api/schema', schema_name, '*.rb')
Dir[schema_path].sort.each { |file| require file }
schema_instance = Kernel.const_get("HuntersLodge::Schema::#{schema_name.capitalize}")
$app = GraphQLServer.new(schema: schema_instance, route: "/#{schema_name}")

def handler(event:, context:)
  handle_request(app: $app, event: event, context: context)
end

# frozen_string_literal: true

require 'rack/cors'
require_relative 'src/api/rack_app'

@schema_path = File.join(__dir__, 'src/api/schema', '**', '*.rb')
@schema_paths = Dir[@schema_path].sort
@schema_paths.each { |file| require file }

@schemas = HuntersLodge::Schema.constants.map do |schema_name|
  schema_instance_name = "HuntersLodge::Schema::#{schema_name}"
  puts "Loading... #{schema_instance_name}..."
  schema_instance = Kernel.const_get(schema_instance_name)
  GraphQLServer.new schema: schema_instance, route: "/#{schema_name}"
end

run Rack::Cascade.new(@schemas)

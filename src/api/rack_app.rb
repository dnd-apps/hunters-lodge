# require 'mini_magick'
# require 'fileutils'
#
# # zoom_levels = %i[256 512 1024 2048 4096]
# # asset_dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'assets/map'))
# # input_file = File.join(asset_dir, 'world.jpeg')
# #
# # zoom_levels.each_with_index do |size, zoom_level|
# #   tile_dir = File.join(asset_dir, 'tiles')
# #   FileUtils.mkdir_p(tile_dir) unless File.directory?(tile_dir)
# #   zoom_dir = File.join(tile_dir, zoom_level.to_s)
# #   FileUtils.mkdir_p(zoom_dir) unless File.directory?(zoom_dir)
# #
# #   resize_setting = format('%<size>sx%<size>s', size: size)
# #   crop_setting = format('%<size>sx%<size>s', size: 256)
# #   convert = MiniMagick::Tool::Convert.new
# #   convert << input_file
# #   convert.resize(resize_setting)
# #   convert.repage.+
# #   convert.crop(crop_setting)
# #   convert.set('filename:tile')
# #   convert.merge! ["#{zoom_dir}/%[fx:page.x/256]-%[fx:page.y/256]"]
# #   convert << '%[filename:tile].jpeg'
# #   convert.call
# # end
#
# require 'grape'
# require_relative 'lambdas/images'
#
# module HuntersLodge
#   class Api < Grape::API
#     before do
#       header 'Access-Control-Allow-Origin', '*'
#       header 'Access-Control-Allow-Methods', %w[OPTIONS POST GET]
#     end
#
#     mount HuntersLodge::Images
#
#     version 'v1', using: :header, vendor: 'hunters-lodge'
#     format :json
#     prefix :api
#
#
#     get :hello do
#       { hello: 'world' }
#     end
#   end
# end


require 'rack'

class GraphQLServer
  def initialize(schema:, route: '/', context: {})
    @route = route.downcase
    @schema = schema
    @context = context
  end

  def response(status: 200, response:)
    [
      status,
      {
        'Content-Type' => 'application/json',
        'Content-Length' => response.bytesize.to_s
      },
      [response]
    ]
  end

  def handle_path_mismatch(received:, expected: @route)
    response(
      status: 405,
      response: {
        message: 'Path mismatch',
        expected: expected,
        received: received
      }.to_json
    )
  end

  def handle_valid_request(request:)
    payload = parse_payload params: request.params, body: request.body.read
    result = @schema.execute(
      payload['query'],
      variables: payload['variables'],
      operation_name: payload['operationName'],
      context: @context
    ).to_json
    response(status: 200, response: result)
  end

  def correct_path?(path: '/')
    /(#{@route})(?:y|ies|s)?$/i.match?(path)
  end

  def parse_payload(params:, body:)
    parsed_body = JSON.parse(body)
    if params.empty?
      parsed_body
    else
      params
    end
  end

  def call(env)
    request = Rack::Request.new(env)
    if correct_path? path: request.path
      handle_valid_request request: request
    else
      handle_path_mismatch received: request.path
    end
  end
end

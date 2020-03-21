require 'graphql'
require_relative 'query/user'

module HuntersLodge
  module Schema
    # User Schema
    class User < GraphQL::Schema
      query HuntersLodge::UserQuery
    end
  end
end

require 'graphql'
require_relative '../types/user'

module HuntersLodge
  class UserQuery < GraphQL::Schema::Object
    description "The query root of this schema"

    field :users, [HuntersLodge::UserType], null: false do
      description 'Get all books'
    end

    def users
      [
        { email: '123@example.com', name: 'catter', discord_id: 'bananaman' }
      ]
    end

  end
end

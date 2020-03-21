require 'graphql'

module HuntersLodge
  class UserType < GraphQL::Schema::Object
      description 'Resembles a User'

      field :email, String, null: false
      field :name, String, null: false
      field :discord_id, String, null: false
    end
end

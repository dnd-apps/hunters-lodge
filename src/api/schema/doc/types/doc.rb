# frozen_string_literal: true

require 'graphql'

module HuntersLodge
  # DocType
  class DocType < GraphQL::Schema::Object
    description 'Resembles a Doc'

    field :content, String, null: false
    field :created_at, String, null: false
    field :created_by, String, null: false
    field :modified_at, String, null: false
    field :modified_by, String, null: false
  end
end

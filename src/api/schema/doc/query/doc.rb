# frozen_string_literal: true

require 'graphql'
require_relative '../types/doc'

module HuntersLodge
  # DocQuery
  class DocQuery < GraphQL::Schema::Object
    description 'The query root of this schema'

    field :docs, [HuntersLodge::DocType], null: false do
      description 'Get all books'
    end

    def docs
      [
        {
          content: 'catter',
          created_at: 'bananaman',
          created_by: '12',
          modified_at: 'bananaman',
          modified_by: 'catter'
        }
      ]
    end
  end
end

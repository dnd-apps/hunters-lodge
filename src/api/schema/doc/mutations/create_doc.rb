require 'graphql'
require_relative '../types/doc'

module HuntersLodge
  module DocMutations
    class CreateDoc < GraphQL::Schema::Mutation
      argument :doc,  String, required: true
      argument :doc_id, ID, required: true

      field :doc, HuntersLodge::DocType, null: false
      field :id, ID, null: false


      def resolve(doc:, doc_id:)
        puts doc, doc_id
      end

    end
  end
end
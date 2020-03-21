require 'graphql'
require_relative 'mutations/create_doc'

module HuntersLodge
  module MutationConfig
    class DocMutations < GraphQL::Schema::Object
      field :create_doc, mutation: HuntersLodge::DocMutations::CreateDoc
    end
  end
end

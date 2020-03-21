# frozen_string_literal: true

require 'graphql'
require_relative 'query/doc'
require_relative 'mutation_config'

module HuntersLodge
  module Schema
    # Doc Schema
    class Doc < GraphQL::Schema
      query HuntersLodge::DocQuery
      mutation HuntersLodge::MutationConfig::DocMutations
    end
  end
end

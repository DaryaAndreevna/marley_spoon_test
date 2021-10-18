module Repositories
  class Recipes
    attr_reader :records

    def self.all(client: ContentfulClient.instance, **params)
      new(client: client).build(params)
    end

    def initialize(client: ContentfulClient.instance)
      @records = client.recipes
    end

    def build(includes: [])
      records.map do |record|
        Recipe.new(record: record).build(includes: includes)
      end
    end
  end
end

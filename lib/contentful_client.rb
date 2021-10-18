class ContentfulClient
  include Singleton

  attr_reader :client

  def initialize
    @client = Contentful::Client.new(
      access_token: Rails.application.credentials.contentful[:access_token],
      space: Rails.application.credentials.contentful[:space],
      dynamic_entries: :auto,
      logger: Logger.new("contentful.log"),
      raise_for_empty_fields: false
    )
  end

  def recipes
    client.entries(content_type: 'recipe')
  end

  def recipe(id)
    client.entry(id)
  end
end

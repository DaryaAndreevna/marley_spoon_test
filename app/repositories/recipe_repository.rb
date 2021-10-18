# frozen_string_literal: true

class RecipeRepository
  attr_reader :record

  def self.find(id)
    new(id: id).build
  end

  def initialize(id: nil, record: nil, client: ContentfulClient.instance)
    @record = record || client.recipe(id)
  end

  def build(includes: RecipeEntry::LINKED_ENTRIES)
    recipe.tap do |entry|
      entry.photo = photo if includes.include?(:photo)
      entry.chef = chef if includes.include?(:chef)
      entry.tags = tags if includes.include?(:tags)
    end
  end

  private

  def recipe
    RecipeEntry.new(id: record.id, **record.fields)
  end

  def photo
    return unless record.photo

    PhotoEntry.new(id: record.photo.id, **record.photo.fields)
  end

  def chef
    return unless record.chef

    ChefEntry.new(id: record.chef.id, **record.chef.fields)
  end

  def tags
    return [] unless record.tags

    record.tags.map do |tag|
      TagEntry.new(id: tag.id, **tag.fields)
    end
  end
end

# frozen_string_literal: true

class RecipeEntry < BaseEntry
  fields :id,
         :title,
         :calories,
         :description

  linked_entries :photo, :chef, :tags
end

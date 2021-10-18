module Entries
  class Recipe < Base
    fields :id,
           :title,
           :calories,
           :description

    linked_entries :photo, :chef, :tags
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :recipe, class: "Entries::Recipe" do
    id { "id" }
    title { "title" }
    calories { "callories" }
    description { "description" }

    association(:photo, factory: :photo)
    association(:chef, factory: :chef)
    association(:tags, factory: :tag)
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :tag, class: "Entries::Tag" do
    name { "name" }
  end
end

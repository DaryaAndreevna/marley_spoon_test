# frozen_string_literal: true

FactoryBot.define do
  factory :chef, class: "Entries::Chef" do
    name { "name" }
  end
end

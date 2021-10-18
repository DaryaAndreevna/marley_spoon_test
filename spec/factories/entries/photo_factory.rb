# frozen_string_literal: true

FactoryBot.define do
  factory :photo, class: "Entries::Photo" do
    file { "file" }
  end
end

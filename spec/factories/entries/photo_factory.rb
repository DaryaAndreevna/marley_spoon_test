# frozen_string_literal: true

FactoryBot.define do
  factory :photo, class: "PhotoEntry" do
    file { "file" }
  end
end

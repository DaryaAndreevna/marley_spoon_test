# frozen_string_literal: true

RSpec.describe RecipeEntry do
  subject(:recipe) { build(:recipe) }

  let(:expected_fields) { %i[id title calories description] }
  let(:expected_linked_entries) { %i[photo chef tags] }

  it "defines fields" do
    expect(described_class::FIELDS).to eq(expected_fields)
  end

  it "defines linked entries" do
    expect(described_class::LINKED_ENTRIES).to eq(expected_linked_entries)
  end

  it "inherits from Base" do
    expect(described_class).to be < BaseEntry
  end
end

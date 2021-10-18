# frozen_string_literal: true

RSpec.describe Entries::Chef do
  subject(:chef) { build(:chef) }

  let(:expected_fields) { %i[name] }

  it "defines fields" do
    expect(described_class::FIELDS).to eq(expected_fields)
  end

  it "inherits from Base" do
    expect(described_class).to be < Entries::Base
  end
end

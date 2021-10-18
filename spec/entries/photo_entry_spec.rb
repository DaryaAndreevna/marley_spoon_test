# frozen_string_literal: true

RSpec.describe PhotoEntry do
  subject(:photo) { described_class.new(file: file) }

  let(:file) { instance_double "Photo File", { url: "//file.png" } }
  let(:expected_fields) { %i[file] }

  it "defines fields" do
    expect(described_class::FIELDS).to eq(expected_fields)
  end

  it "inherits from Base" do
    expect(described_class).to be < BaseEntry
  end

  describe "#url" do
    let(:expected_url) { "https://file.png" }
    let(:expected_thumb) { "https://file.png?w=300" }
    let(:expected_medium) { "https://file.png?w=500" }

    it "wraps photo url" do
      expect(photo.url).to eq expected_url
    end

    it "returns a thumb version" do
      expect(photo.url(:thumb)).to eq expected_thumb
    end

    it "returns a medium version" do
      expect(photo.url(:medium)).to eq expected_medium
    end
  end
end

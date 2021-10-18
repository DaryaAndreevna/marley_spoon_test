# frozen_string_literal: true

RSpec.describe Entries::Photo do
  subject(:photo) { Entries::Photo.new(file: file) }

  let(:file) { instance_double "Photo File", { url: "//file.png" } }
  let(:expected_fields) { %i[file] }

  it "defines fields" do

    expect(described_class::FIELDS).to eq(expected_fields)
  end

  it "inherits from Base" do
    expect(described_class).to be < Entries::Base
  end

  describe "#url" do
    let(:expected_url) { "https://file.png" }

    it "wraps photo url" do
      expect(photo.url).to eq expected_url
    end
  end
end

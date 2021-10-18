# frozen_string_literal: true

RSpec.describe ContentfulClient do
  subject(:instance) { described_class.instance }

  let(:sdk_client) { instance_double "SDK Client" }
  let(:content_type) { "recipe" }

  before { allow(instance).to receive(:client).and_return(sdk_client) }

  describe "#recipe" do
    let(:id) { "some_entry_id" }

    before { allow(sdk_client).to receive(:entry).with(id).and_return("Smth") }

    it "calls SDK method for entry" do
      instance.recipe(id)

      expect(sdk_client).to have_received(:entry).with(id)
    end

    it "returns contentful entry for recipe" do
      expect(instance.recipe(id)).not_to be_nil
    end
  end

  describe "#recipes" do
    before { allow(sdk_client).to receive(:entries).with(content_type: content_type).and_return(["Smth"]) }

    it "returns contentful entries for recipes" do
      expect(instance.recipes).not_to be_nil
    end
  end
end

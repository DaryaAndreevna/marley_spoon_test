# frozen_string_literal: true

RSpec.describe RecipesRepository do
  subject(:recipes_repository) { described_class.new(**params) }

  let(:params) { { client: client } }

  context "with contentful client" do
    include_context "contentful_client"

    let(:client) { contentful_client }

    describe "#build" do
      it "returns recipes collection" do
        expect(recipes_repository.build).to all(be_kind_of(RecipeEntry))
      end

      context "when included entries are passed" do
        let(:included_entries) { [:photo] }

        it "returns recipes collection with included entries" do
          recipes_collection = recipes_repository.build(includes: included_entries)

          expect(recipes_collection.first.photo).to be_kind_of(PhotoEntry)
        end
      end
    end

    describe ".all" do
      before do
        allow(described_class).to receive(:new).and_return(recipes_repository)
        allow(recipes_repository).to receive(:build)
      end

      it "calls new.build" do
        described_class.all

        expect(described_class).to have_received(:new)
        expect(recipes_repository).to have_received(:build)
      end
    end
  end
end

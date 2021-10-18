# frozen_string_literal: true

RSpec.describe Repositories::Recipe do
  subject(:recipe_repository) { described_class.new(**params) }

  let(:recipe) { build(:recipe) }
  let(:params) { { id: recipe.id } }

  context "with contentful client" do
    include_context "contentful_client"

    let(:client) { contentful_client }

    describe "#build" do
      context "when ID is passed" do
        let(:params) { { id: recipe.id, client: client } }

        it "returns recipe entry" do
          expect(recipe_repository.build).to be_kind_of(Entries::Recipe)
        end

        it "contains all included entries" do
          entry = recipe_repository.build

          expect(entry.photo).to be_kind_of(Entries::Photo)
          expect(entry.chef).to be_kind_of(Entries::Chef)
          expect(entry.tags).to all(be_kind_of(Entries::Tag))
        end
      end

      context "when record is passed" do
        let(:params) { { record: client.recipe(recipe.id) } }

        describe "#build" do
          it "returns recipe entry" do
            expect(recipe_repository.build).to be_kind_of(Entries::Recipe)
          end
        end
      end
    end

    describe ".find" do
      before do
        allow(described_class).to receive(:new).and_return(recipe_repository)
        allow(recipe_repository).to receive(:build)
      end

      it "calls new.build" do
        described_class.find(recipe.id)

        expect(described_class).to have_received(:new)
        expect(recipe_repository).to have_received(:build)
      end
    end
  end
end

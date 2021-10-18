# frozen_string_literal: true

RSpec.describe RecipesController, type: :controller do
  describe "GET #index" do
    let(:recipes) { build_list(:recipe, 4) }

    before do
      allow(Repositories::Recipes).to receive(:all).and_return(recipes)

      get :index
    end

    it "responds with 200 ok" do
      expect(response.status).to eq 200
    end

    it "calls repository" do
      expect(Repositories::Recipes).to have_received(:all)
    end
  end

  describe "GET #show" do
    let(:recipe) { build :recipe }

    before do
      allow(Repositories::Recipe).to receive(:find).and_return(recipe)

      get :show, params: { id: recipe.id }
    end

    it "responds with 200 ok" do
      expect(response.status).to eq 200
    end

    it "calls repository" do
      expect(Repositories::Recipe).to have_received(:find)
    end
  end
end

class RecipesController < ApplicationController
  def index
    @recipes = Repositories::Recipes.all(includes: [:photo])
  end

  def show
    @recipe = Repositories::Recipe.find(params[:id])
  end
end

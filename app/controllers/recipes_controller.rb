# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    @recipes = RecipesRepository.all(includes: [:photo])
  end

  def show
    @recipe = RecipeRepository.find(params[:id])
  end
end

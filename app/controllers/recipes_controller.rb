class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    set_recipe
  end

  def new
    @recipe = Recipe.new
    all_ingredients
  end

  def create
    recipe = Recipe.new(recipe_params)
    if recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
    set_recipe
    all_ingredients
  end

  def update
    set_recipe
    @recipe.update(recipe_params)

    if @recipe.save
      redirect_to recipes_path
    else
      render :edit
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def all_ingredients
    @ingredients = Ingredient.all
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end
end

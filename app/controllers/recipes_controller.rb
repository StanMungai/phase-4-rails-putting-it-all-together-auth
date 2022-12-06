class RecipesController < ApplicationController

  def index
    recipes = Recipe.all
    render json: recipes
  end

  def create
    recipe = @user.recipes.create!(recipe_params)
    render json: recipe, status: :created
  end

  private

  def recipe_params
    params.permit(:title, :instructions, :minutes_to_complete)
  end

  def render_unauthorized_user
    render json: { error: "Unathorized or Invalid user "}, status: :unauthorized
  end

end

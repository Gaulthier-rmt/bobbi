class RecipesController < ApplicationController

  def index
    event = Event.find(params[:id])
    @snacks = event.recipes.where(category: "nourriture")
    @drinks = event.recipes.where(category: "boisson")
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @event = Event.find(params[:event_id])
    @recipe = Recipe.new
    @recipe.event = @event
    @recipe.user = current_user
    if @recipe.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def update
    @recipe = recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  ####

  def recipe
    # raise
    @event = Event.find(params[:id])
    @recipes = @event.recipes
  end
end

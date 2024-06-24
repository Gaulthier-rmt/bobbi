class IngredientsController < ApplicationController
  def index
    @event = Event.find(params[:id])
    @snacks = @event.ingredients.where(category: "nourriture")
    @drinks = @event.ingredients.where(category: "boisson")
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @event = Event.find(params[:id])
    ingredient = Ingredient.new(ingredient_params)
    ingredient.event = @event
    ingredient.user = current_user
    if params[:ingredient][:managed] == "true"
      ingredient.manager = current_user
    end
    if ingredient.save
      redirect_to ingredients_path(@event)
    else
      render :new
    end
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.manager = current_user
    @ingredient.save
    redirect_to ingredients_path(@ingredient.event)
    # redirect_to
  end

  def destroy
    @ingredient = ingredient.find(params[:id])
    @ingredient.destroy
    # redirect_to
  end

  ####

  def ingredient
    # raise
    @event = Event.find(params[:id])
    @ingredient = @ingredient.recipes
  end


  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :price, :category)
  end
end

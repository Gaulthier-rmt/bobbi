class IngredientsController < ApplicationController
  def index
    event = Event.find(params[:id])
    @snacks = event.ingredients.where(category: "nourriture")
    @drinks = event.ingredients.where(category: "boisson")
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @event = Event.find(params[:event_id])
    @ingredient = Ingredient.new
    @ingredient.event = @event
    @ingredient.user = current_user
    if @ingredient.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def update
    @ingredient = ingredient.find(params[:id])
    @ingredient.update(ingredient_params)
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

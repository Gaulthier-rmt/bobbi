class RemoveBooleanIngredients < ActiveRecord::Migration[7.1]
  def change
    remove_column :ingredients, :managed
    remove_column :ingredients, :bought
  end
end

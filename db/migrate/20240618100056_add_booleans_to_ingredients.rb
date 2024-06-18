class AddBooleansToIngredients < ActiveRecord::Migration[7.1]
  def change
    add_column :ingredients, :managed, :boolean, default: false
    add_column :ingredients, :bought, :boolean, default: false
  end
end

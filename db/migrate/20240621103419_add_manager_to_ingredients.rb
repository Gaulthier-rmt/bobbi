class AddManagerToIngredients < ActiveRecord::Migration[7.1]
  def change
    add_reference :ingredients, :manager, foreign_key: { to_table: :users}
  end
end

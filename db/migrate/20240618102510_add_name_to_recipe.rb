class AddNameToRecipe < ActiveRecord::Migration[7.1]
  def change
    add_column :recipes, :name, :string
  end
end

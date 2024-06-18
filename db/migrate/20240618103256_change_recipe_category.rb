class ChangeRecipeCategory < ActiveRecord::Migration[7.1]
  def change
    remove_column :recipes, :categroy
    add_column :recipes, :category, :string
  end
end

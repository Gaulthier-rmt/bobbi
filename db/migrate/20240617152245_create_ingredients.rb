class CreateIngredients < ActiveRecord::Migration[7.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.references :recipe, null: false, foreign_key: true
      t.boolean :managed
      t.boolean :bought
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.float :price

      t.timestamps
    end
  end
end

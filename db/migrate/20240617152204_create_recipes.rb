class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.references :event, null: false, foreign_key: true
      t.string :categroy

      t.timestamps
    end
  end
end

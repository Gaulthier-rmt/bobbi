class AddQuestionToPoll < ActiveRecord::Migration[7.1]
  def change
    add_column :polls, :question, :string
  end
end

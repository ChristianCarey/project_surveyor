class CreateMultipleChoiceSelections < ActiveRecord::Migration[5.0]
  def change
    create_table :multiple_choice_selections do |t|
      t.boolean :multiple
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end

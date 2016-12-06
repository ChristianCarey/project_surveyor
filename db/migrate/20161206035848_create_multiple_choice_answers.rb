class CreateMultipleChoiceAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :multiple_choice_answers do |t|
      t.references :response, foreign_key: true
      t.references :option, foreign_key: true
      t.integer :selection_id

      t.timestamps
    end
  end
end

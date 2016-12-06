class CreateNumericAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :numeric_answers do |t|
      t.integer :selection_id
      t.float :value
      t.references :response, foreign_key: true

      t.timestamps
    end
  end
end

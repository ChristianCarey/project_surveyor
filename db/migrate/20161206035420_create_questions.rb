class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :prompt
      t.boolean :required
      t.integer :selection_type_id
      t.references :survey, foreign_key: true

      t.timestamps
    end
  end
end

class MakeNumericAnswersPolymorphic < ActiveRecord::Migration[5.0]
  def change
    add_column :numeric_answers, :selection_type, :string

    add_index :numeric_answers, [:selection_id, :selection_type]
  end
end

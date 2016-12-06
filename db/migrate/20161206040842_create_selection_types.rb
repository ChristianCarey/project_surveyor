class CreateSelectionTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :selection_types do |t|
      t.string :class_name

      t.timestamps
    end
  end
end

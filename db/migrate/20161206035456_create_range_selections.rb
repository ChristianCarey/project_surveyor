class CreateRangeSelections < ActiveRecord::Migration[5.0]
  def change
    create_table :range_selections do |t|
      t.integer :min
      t.integer :max
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end

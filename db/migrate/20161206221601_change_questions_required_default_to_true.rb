class ChangeQuestionsRequiredDefaultToTrue < ActiveRecord::Migration[5.0]
  def up
    change_column :questions, :required, :boolean, default: true
  end

  def down
    change_column :questions, :required, :boolean
  end
end

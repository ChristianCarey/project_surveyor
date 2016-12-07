class AddStringVersionToSelectionType < ActiveRecord::Migration[5.0]
  def change
    add_column :selection_types, :string_version, :string
  end
end

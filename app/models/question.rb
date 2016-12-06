class Question < ApplicationRecord
  before_destroy :destroy_selection

  belongs_to :survey
  belongs_to :selection_type

  def selection
    selection_class.where(question_id: id).first
  end

  def selection_class
    selection_type.class_name.constantize
  end

  private

  def destroy_selection
    selection.destroy if selection
  end
end

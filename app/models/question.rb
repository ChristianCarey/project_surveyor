class Question < ApplicationRecord
  before_destroy :destroy_selection
  
  belongs_to :survey
  belongs_to :selection_type
  validates :prompt, presence: true

  def selection
    selection_class.where(question_id: id).first
  end

  def selection_class
    selection_type.class_name.constantize
  end

  def build_selection(klass, params = {})
    klass.new(params)
  end

  private

  def destroy_selection
    selection.destroy if selection
  end
end
